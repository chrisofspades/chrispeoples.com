param(
    $Token = $(throw "Token parameter is required")
)

$collectionId = "64499074"
$lastUpdated = git log -1 --pretty="format:%cs" -- .\content\links 
$uri = "https://api.raindrop.io/rest/v1/raindrops/$($collectionId)?sort=created&search=created:>$lastUpdated"

$headers=@{}
$headers.Add("authorization", "Bearer $Token")
$response = Invoke-RestMethod -Uri $uri -Method GET -Headers $headers

if ( ($response.result) -and ($response.count -gt 0) ) 
{

    
}

foreach($raindrop in $response.items)
{
    $tagsYaml = ""
    if ($raindrop.tags) 
    {
        $tagsYaml = "tags:"
        $raindrop.tags | ForEach-Object {
            $tagsYaml += "`r`n- $_"
        }
    }

    $content = @"
---
title: "$($raindrop.title)"
date: $($raindrop.created)
target: "$($raindrop.link)"
domain: $($raindrop.domain)
$tagsYaml
---

$($raindrop.note)
"@

    $filename = ([datetime]$raindrop.created).ToString("yyyy-MM-dd") + "-"
    $filename += $raindrop.title.ToLower() `
        -replace '[^a-zA-Z0-9-]', '-' `
        -replace '-+', '-' `
        -replace '(^-|-$)', ''

    $filename += ".md"
    
    New-Item "content\links\$filename" -ItemType File -Value $content
}