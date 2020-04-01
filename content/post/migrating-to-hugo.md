---
title: "Migrating to Hugo"
date: 2020-03-31T12:12:25-07:00
tags:
- hugo
- wyam
---
I started using a static site generator for my personal site back in 2018. I was looking for a more lightweight platform than Wordpress, and SSG's were a great alternative. Especially since they fit great into CI/CD workflows. I selected [Wyam](https://wyam.io) because it's written in C# and used Razor for it's templating syntax, which made my transition easier since I'm already familiar with both of those. Wyam served me great for two years, but development on the project has stopped in favor of a new framework, [Statiq](https://github.com/statiqdev/Statiq.Framework). Since Statiq's release is TBD, I decided to migrate to [Hugo](https://gohugo.io).

Hugo describes itself as a <q cite="https://gohugo.io/about/what-is-hugo/">fast and modern static site generator written in Go, and designed to make website creation fun again.</q> I can confirm that it delivers on all of those promises. Fast is an understatement. My site now builds in about 300 milliseconds, compared to 10 - 20 seconds with Wyam.

Migrating from Wyam to Hugo was pretty straight-forward. First I found a theme - Noteworthy - that came the closest to providing everything I had on my previous site: tag pages, archives broken down by year, and a minimal and responsive design. I considered creating a theme from scratch using my previous design, but starting from an existing theme really shortened the learning curve. I plan to create my own theme eventually, but Noteworthy works great for now.

With my theme selected, I initialized a new Hugo site with `hugo new site` in my site's existing root directory. Mapping my content to Hugo's directory structure was fairly intuitive:

| Wyam directory   | Hugo directory |                                                                          |
|------------------|----------------|--------------------------------------------------------------------------|
| `input/assets/img` | `static/img`     | Images                                                                   |
| `input/blog`       | `content/post`   | Blog posts                                                               |
| `input/*.md`       | `content/`       | General pages                                                            |
| `input/`           | `static/`        | Any files that need to be published at the site's root (such as favicon) |  

&nbsp;

After my files were in their appropriate place, I worked to get the content actually displaying on the site. Hugo supports YAML front matter, but it requires opening *and* closing `---` lines. I added the opening `---` line to all my markdown files. Hugo also uses a different date field name and format, so I used a regex find and replace to convert all dates to the correct format. Finally I added Hugo's menu system to the front matter of the pages I wanted to appear in navigation, and voila! I had a working Hugo site.

The site was basically working, but still required a few more customizations for complete feature parity. My Wyam site allowed me to add a feature image to posts and pages, but Noteworthy doesn't support that out of the box. Since I already have an `image` front matter field, I just needed to override Noteworthy's `layouts/_default/single.html` template to get the image to display if it's there:

```
    {{ with .Params.image }}
    <img src="{{ . }}" alt="">
    {{ end }}
```

Finally, I created a `custom.scss` file in `assets/css`, and added the styles for my book highlights. I'm quite pleased with the results and really satisfied with Hugo as a platform. In a future post, I'll talk about how I enabled automatic deployments to my web host.


