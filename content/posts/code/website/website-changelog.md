---
title: "Website Code Changelog"
date: 2026-06-15T15:14:06-04:00
draft: false
toc: false
images:
tags:
  - code
  - website
---

This is manually mirrored from my discord under the "website-info" channel.

Some of these posts aren't from the discord and have just been manually added to this changelog.

#### 6-23-2025 
4:26PM

I updated the KelsonCraft website slightly with some changes to the code from my internal git repos:

https://github.com/kelson8/FlaskWeb/commit/5d10268585908cc39efa0fd13ed656c65b4b8b0c



5:39PM

Updated the python version in the Docker file, changed from 3.12.1 to 3.12.10:

https://github.com/kelson8/FlaskWeb/commit/f439f717f9a50485f95d3b3de2c87825a0b1a200

---

#### 7-3-2025
6:19PM

I have updated the KelsonCraft wiki due to me not wanting to host a Minecraft server, also I have made some changes to make the links easier to read.

This wiki might be where I place a lot of things for my website, even technical guides that I may create.
It is very neat and uses markdown for formatting.
Not sure if I'll use wordpress, to me WikiJS is simpler and easier to use and I can easily replicate it between my home lab setup and my main website.

Updated Minecraft section on wiki, and updated main wiki page
https://wiki.kelsoncraft.net/en/minecraft

----

#### 10-4-2025
12:09PM

I have slightly updated the KelsonCraft Flask website
https://github.com/kelson8/FlaskWeb/commit/686ff8099b3c6a5cdd169a0bc2417eea78c9983f
https://github.com/kelson8/FlaskWeb/commit/b1e07c3426d90665bf3b1d7f231af2a4db3ae2a8 

----

#### 10-6-2025
2:36PM

Added .sh viewer in browser, this makes the site not download .sh files directly but instead view them in the browser
https://github.com/kelson8/FlaskWeb/commit/a569ebc40dc38976169e7d688a7de22a5ead97f0

Refactored the code just a bit
https://github.com/kelson8/FlaskWeb/commit/81a0b6b89731094988083a5ead367928119e4483 

2:57PM

Should be the last change i do for now, updated website navbar to be more mobile optimized

https://github.com/kelson8/FlaskWeb/commit/dd97a03df9182b0f8478537208a306606233a1f5

----

#### 10-8-2025
12:51PM

Refactor more pages into their own files, instead of being in the main flask_web.py file
https://github.com/kelson8/FlaskWeb/commit/a5ffd0bc2f34d724cb5e4de32577d5c127fed68c

1:39PM

I have disabled direct viewing of .sh files in the browser due to the page crashing

https://github.com/kelson8/FlaskWeb/commit/680007f4ef8e68598ac78b29fb94debeffef0fa0

----

#### 10-9-2025
1:04PM

I have now created a base html file for my Flask project to use instead of duplicating the same html everywhere and changed most of my html to use this new format, it makes the code much neater and easier to maintain.

https://github.com/kelson8/FlaskWeb/commit/bf5a2a5f215c27bb89614a28bd8120ae7ff06a84

----

#### 10-12-2025
2:50PM

I have updated the video pages to use plyr js, it makes the video player look better, also i moved the javascript and css files around in the static folder.
This also disables direct downloads of the website videos, i may re-enable that later

https://github.com/kelson8/FlaskWeb/commit/c05b4e65f603f6d21d555950bb55e40be2061e61

----

#### 10-15-2025
11:27PM

I have now enabled the login test to work for certain items on the website, and I have changed the dark mode button.
There are quite a few other misc changes in this commit.
Also, there is one thing currently broken, dark mode isn't on by default but I'll fix it later.

https://github.com/kelson8/FlaskWeb/commit/cd1450b90e025a76b1c0dea591601aae40092efd 

----

#### 11-6-2025
2:21PM

I have now fixed the contrast for the links on the website in light mode, I broke it when i changed my dark mode button and couldn't figure out how to fix it before.

https://github.com/kelson8/FlaskWeb/commit/2698e2a2738c63caf91a59e4ef6d3ee6bde9d009 

2:49PM

Updated bootstrap version on website from 5.3.3 to 5.3.8, and updated python version to 3.12.12

https://github.com/kelson8/FlaskWeb/commit/27d4a5b2713a9bc4723b635a3dcaffeebc1aeaf9
https://github.com/kelson8/FlaskWeb/commit/74fe51146a1146b5b4de22b9c5c237fdebdb2892

----

#### 1-9-2026
3:07PM

I updated the copyright year for the website, and the blog.
Now the website will automatically update the copyright year, the blog will still have to be manually updated but it's not too big of a deal for me.

----

#### 5-15-2026
11:21AM

I have updated the website from using Python 3.12.12 to 3.14.5, there doesn't seem to be any noticeable changes and my version had some possible exploits that could've been used.

I attempted to upgrade locally first to make sure this was all working.
The website seems to be stable on the latest version.

Here is the latest commit to the website update, I made another small commit but it was just fixing something:
https://github.com/kelson8/FlaskWeb/commit/1edd83b4b9f4ab9fe67ac8501573ebd364baf6b4

---

#### 5-30-2026
11:52AM

I plan on migrating the website from Python Flask to NextJS sometime in the future, this new website will be licensed under
 the AGPLv3 license instead of GPLv3 like my current website is.
I am also switching from Bootstrap CSS to Tailwind CSS to make my website look nicer.

Here is the code to the new website, which also has just a single screenshot for now until I'm ready to add more to it.
* https://github.com/kelson8/KelsonCraft-NextJS

This will probably take me a few weeks to finalize the new website and have it ready to replace the main [KelsonCraft](https://kelsoncraft.net) website, currently I am missing parts for this such as the video page using [plyr-react](https://www.npmjs.com/package/plyr-react) for the video pages, and authentication which I will add in the future.

I may just skip adding authentication and the SQLite DB until later and just work on getting the videos working for the website.

---

#### 6-13-2026

6:19PM

I now have another cheap VPS again from Hetzner to host the new Astro website, I need to work on getting docker support for it before I can fully deploy it.

I may move this website back to the main VPS sometime which would bring the website offline for a bit once I get it all ready.

#### 6-15-2026

3:10PM

Here is the new Kelsoncraft website, I mostly have it working now and I just need to switch the main domain to using it.
This is the website changed from Python Flask to the Astro framework and it's just a basic static site so it uses very little resources.

I still need to figure out how to fix the dark mode and navbar when it is on the main domain, it doesn't want to work for some reason.

https://new.kelsoncraft.net/

8:58PM

Now the primary website is fully switched over to the new code, this took me a bit to figure somethings out.
This new setup should allow me to update the website much easier then before.

https://kelsoncraft.net/

