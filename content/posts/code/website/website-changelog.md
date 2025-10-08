---
title: "Website Code Changelog"
date: 2025-10-08T12:55:06-04:00
draft: false
toc: false
images:
tags:
  - code
  - website
---

This is mirrored from my discord under the "website-info" channel.

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