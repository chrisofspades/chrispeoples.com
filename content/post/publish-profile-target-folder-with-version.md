---
title: "Including Version Number When Publishing to a Folder in Visual Studio 2022"
date: 2025-03-24
tags:
    - code
    - visual-studio
draft: true
---

I recently worked on an application in Visual Studio 2022 where I'm publishing to a folder and I wanted to include the version number in that path, e.g. `C:\PublishTemp\MyApplication\v1.0.0\`. I had already settled on using `Directory.Build.props` to set the version number, and I didn't want to repeat this information in the publish profile. What was I to do? With hindsight, it's easy: use [MSBuild property functions](https://learn.microsoft.com/en-us/visualstudio/msbuild/property-functions?view=vs-2022) to read the `<Version>` tag value from `Directory.Build.props` and insert it into the publish profile (`.pubxml`), like so:

```xml
<DirectoryBuildPropsPath>$([MSBuild]::GetPathOfFileAbove('Directory.Build.props'))</DirectoryBuildPropsPath>
<DirectoryBuildPropsContent>$([System.IO.File]::ReadAllText($(DirectoryBuildPropsPath)))</DirectoryBuildPropsContent>
<VersionMatch>$([System.Text.RegularExpressions.RegEx]::Match($(DirectoryBuildPropsContent), '<Version>(.+)</Version>').Groups)</VersionMatch>
<Version>$(VersionMatch.Substring($([MSBuild]::Add($(VersionMatch.IndexOf(';')), 1))))</Version>
<PublishUrl>C:\PublishTemp\MyApplication\v$(Version)</PublishUrl>
```

My first thought was that since a publish profile 