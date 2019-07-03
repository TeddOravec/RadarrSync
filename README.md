Forked from FunkyPenguin, added support for not destroying your configs every time you boot and running both SonarrSync and RadarrSync

[cookbookurl]: https://geek-cookbook.funkypenguin.co.nz
[kitchenurl]: https://discourse.kitchen.funkypenguin.co.nz
[discordurl]: http://chat.funkypenguin.co.nz
[patreonurl]: https://patreon.com/funkypenguin
[blogurl]: https://www.funkypenguin.co.nz
[hub]: https://hub.docker.com/r/funkypenguin/alertmanager-discord/

[![geek-cookbook](https://raw.githubusercontent.com/funkypenguin/www.funkypenguin.co.nz/master/images/geek-kitchen-banner.png)][cookbookurl]

# Contents

1. [What is funkypenguin/radarrsync?](#what-is-funkypenguin-radarrsync)
2. [Why should I use this?](#why-should-i-use-this)
3. [How do I use it?](#how-do-i-use-this)
4. [CHANGELOG](#changelog)
5. [Upstream-readme](#Upstream-README)


---

This container is maintained by [Funky Penguin's Geek Cookbook][cookbookurl], a collection of "recipes" to run popular applications
on Docker Swarm or Kubernetes, in a cheeky, geek format.

Got more details at:
* ![Discourse with us!](https://img.shields.io/discourse/https/discourse.geek-kitchen.funkypenguin.co.nz/topics.svg) [Forums][kitchenurl]
* ![Chat with us!](https://img.shields.io/discord/396055506072109067.svg) [Friendly Discord Chat][discordurl]
* ![Geek out with us!](https://img.shields.io/badge/recipies-35+-brightgreen.svg) [Funky Penguin's Geek Cookbook][cookbookurl]
* ![Thank YOU](https://img.shields.io/badge/thank-you-brightgreen.svg) [Patreon][patreonurl]
* ![Read blog!](https://img.shields.io/badge/read-blog-brightgreen.svg) [Blog][blogurl]

---

# What is funkypenguin/radarrsync ?

A Dockerization of https://github.com/Sperryfreak01/RadarrSync, plus a few enhancments:

* Ability to rewrite path of movie on destination Raddarr instance : [39](https://github.com/Sperryfreak01/RadarrSync/pull/39)
* Ability to sync between arbitrary quality profiles on source and target instance : [38](https://github.com/Sperryfreak01/RadarrSync/pull/38)

# Why should I use this?

You should use it if you [use Docker for your Radarr instances](https://geek-cookbook.funkypenguin.co.nz/recipes/autopirate/), and you want to sync content (like your watchlist) between two Radarr instances, for the purposes of downloading
two separate files of different quality (say, a 1080P WebDL and a 4K UHD).

# How do I use this?

# CHANGELOG

* Initial release : (_1 Jan 2019_)

---


# Upstream README follows..

## RadarrSync
Syncs two Radarr servers through web API.  

### Why
Many Plex servers choke if you try to transcode 4K files. To address this a common approach is to keep a 4k and a 1080/720 version in seperate libraries.

Radarr does not support saving files to different folder roots for different quality profiles.  To save 4K files to a seperate library in plex you must run two Radarr servers.  This script looks for movies with a quality setting of 4k on one server and creates the movies on a second server.  


### Configuration
 1. Edit the Config.txt file and enter your servers URLs and API keys for each server.  

    Example Config.txt:
    ```ini
    [Radarr]
    url = https://example.com:443
    key = FCKGW-RHQQ2-YXRKT-8TG6W-2B7Q8
    
    [Radarr4k]
    url = http://127.0.0.1:8080
    key = FCKGW-RHQQ2-YXRKT-8TG6W-2B7Q8
    ```
 2. Edit 4K profile on the server that will download 1080/720p files.  You want the quality profile to download the highest non-4k quality your Plex server can stream with choking. 


#### How to Run
Recomended to run using cron every 15 minutes or an interval of your preference.
```bash
python RadarSync.py
```


#### Requirements
 * Python 3.4 or greater
 * 2x Radarr servers
 * Install requirements.txt

#### Notes
 * Ensure that the root path is the same on both servers. ie /movies
 
 
 
