---
title: Unpopular Positive Opinion Challenge
date: 2019-12-20
tags:
  - movies
  - code
---

From [xkcd.com](https://xkcd.com/2184/):

[![xkcd comic](https://imgs.xkcd.com/comics/unpopular_opinions.png)](https://xkcd.com/2184/)

Challenge accepted, Randall!

I use [Trakt](https://trakt.tv) to keep track and rate all of the movies I watch. Fortunately, Trakt provides an API so that I can programmatically retrieve all of my ratings. The [OMDb API](https://www.omdbapi.com) includes Rotten Tomatoes ratings, so I was able write a small C# console application to compare my ratings of 8 or greater to Rotten Tomatoes. Here's a quick sample of what that code looks like:

```csharp
using Newtonsoft.Json;
using OMDbApiNet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;

namespace UnpopularPositiveOpinionChallenge
{
    
    class Program
    {
        const string _clientId = "";
        const string _clientSecret = "";
        const string _omdbKey = "";

        static void Main(string[] args)
        {
            Console.WriteLine("Getting ratings...");
            
            OmdbClient omdbClient = new OmdbClient(_omdbKey, true);
            List<TraktRatingsItem> unpopularOpinions = new List<TraktRatingsItem>();

            var ratings = GetTraktMovieRatings("chrisofspades", "8,9,10");

            Console.WriteLine("Finding unpopular opinions...");

            foreach (var rating in ratings)
            {
                var item = omdbClient.GetItemById(rating.Movie.Ids.Imdb);
                string tomatoRating = item.Ratings.Where(r => r.Source == "Rotten Tomatoes").Select(r => r.Value).FirstOrDefault();
                decimal? tomatoPercent = tomatoRating.ToDecimalFromPercentage();
                if (tomatoPercent.HasValue == false)
                {
                    continue;
                }

                rating.TomatoRating = tomatoPercent;
                if (tomatoPercent <= 0.5m)
                {
                    unpopularOpinions.Add(rating);
                }
            }

            foreach (var rating in unpopularOpinions)
            {
                Console.WriteLine($"{rating.Movie.Title} - {rating.Rating} - {rating.TomatoRating}");
            }

        }

        static List<TraktRatingsItem> GetTraktMovieRatings(string username, string ratings)
        {
            Uri baseAddress = new Uri("https://api.trakt.tv/");
            using (HttpClient httpClient = new HttpClient { BaseAddress = baseAddress })
            {
                httpClient.DefaultRequestHeaders.TryAddWithoutValidation("trakt-api-version", "2");

                httpClient.DefaultRequestHeaders.TryAddWithoutValidation("trakt-api-key", _clientId);

                using (var response = httpClient.GetAsync($"users/{username}/ratings/movies/{ratings}").Result)
                {
                    string responseData = response.Content.ReadAsStringAsync().Result;
                    return JsonConvert.DeserializeObject<List<TraktRatingsItem>>(responseData);
                }
            }
        }

        static OmdbItem GetOmdbItem()
        {
            return null;
        }


    }
}
```

And without further ado, here are my unpopular opinions:

### **Equilibrium** (2002) 
<img src="/img/equilibrium.jpg" style="float: left; width: 100px; margin-right: 10px">

My rating: 8/10  
Rotten Tomatoes: 40%

I'm surprised that this only scored 40% on the TomatoMeter. It has an audience score of 80%, so maybe the critics got it wrong. I love the action sequences in this movie, and the gun kata fighting style? Superb.

<div style="clear: both;"></div>

### **The Matrix Revolutions** (2003)  
<img src="/img/matrix-revolutions.jpg" style="float: left; width: 100px; margin-right: 10px">

My rating: 8/10  
Rotten Tomatoes: 35%

I realize I may take some heat for this one. **_The Matrix_** is one of the greatest movies ever, and it's sequels are much maligned. But I'm a bigger fan of the sequels than most, and I thoroughly enjoyed **_Revolutions_** in spite of the cheesy CGI battle between Neo and Agent Smith.

<div style="clear: both;"></div>

### **Rent** (2005)  
<img src="/img/rent.jpg" style="float: left; width: 100px; margin-right: 10px">

My rating: 8/10  
Rotten Tomatoes: 47%

I got to see Rent on Broadway and loved it, and this adaptation is pretty accurate. Plus it has most of the original cast, who I never saw on stage. 

<div style="clear: both;"></div>

### **Hector and the Search for Happiness** (2014) 
<img src="/img/hector.jpg" style="float: left; width: 100px; margin-right: 10px">

My rating: 8/10  
Rotten Tomatoes: 37%

I like Simon Pegg; I like stories where the protagonist takes a journey to find meaning in life; I like random, fun adventures; therefore, I like this movie!
