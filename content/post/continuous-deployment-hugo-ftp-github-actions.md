---
title: "Continuous Deployment Via FTP For Hugo Using GitHub Actions"
date: 2020-04-06T17:15:07-07:00
tags:
    - hugo
    - github-actions
    - code
---

After I [migrated my website to Hugo](migrating-to-hugo), I needed a way to deploy the site to my host without manually FTPing files every time I make change. [Netlify](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/) has support for static site hosting and continuous deployment, but I wasn't looking to switch hosts. Previously I used AppVeyor to deploy, but this time I decided to use [GitHub Actions](https://github.com/features/actions) to automate building and deploying the site whenever I push changes to master.

I utilized two actions from the GitHub Marketplace to setup the workflow:

- [GitHub Actions for Hugo](https://github.com/peaceiris/actions-hugo)
- [FTP Deploy](https://github.com/SamKirkland/FTP-Deploy-Action)

I started by created a workflow `.yml` configuration file in `.github/workflows`. I'm triggering the workflow on `git push` to the master branch and also on a schedule using cron:

```yml
name: Deploy via FTP

on:
  push:
    branches:
    - master
  schedule:
    - cron:  '0 8 * * *' #every day at 8 am
```

Next I need to execute the following steps when the job is run:

1. Checkout the latest version of the code
2. Setup Hugo
3. Build the site
4. Deploy the artifacts to my host using FTP

```yml
jobs:
  Deploy:
    runs-on: ubuntu-latest
    steps:

    - uses: actions/checkout@v1
      with:
        submodules: true

    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2
      with:
        hugo-version: 'latest'

    - name: Build site
      run: hugo --minify

    - name: FTP site
      uses: SamKirkland/FTP-Deploy-Action@3.0.0
      with:
        ftp-server: ftp.myhost.com/path/to/my/site
        ftp-username: username
        ftp-password: ${{ secrets.FTP_PASSWORD }}
        local-dir: public/
        git-ftp-args: --insecure --all
```

There are two important things to note about the FTP options I've used:

1. I used [GitHub secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) to securely store my FTP password
2. I had to set the `--insecure` argument so that Git-ftp doesn't attempt to verify the certificate. Unfortunately this was the only way I could get it to connect to my host.

And that's all there is to it! I now have a Hugo-based website that is automatically deployed to my webhost.