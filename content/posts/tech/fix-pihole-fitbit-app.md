---
title: "Fix Pihole blocking Fitbit app"
date: 2025-10-16T18:57:59-04:00
draft: false
toc: false
images:
tags:
  - tech
---

To fix the FitBit app using PiHole, add www.google-analytics.com to the whitelist.

If a group is created in PiHole, the FitBit, and the phone can go on the group you create for this.

I may need to work on this more, it works on my cell service, but not the wifi with PiHole using this setup.

Well, what I had to do was just allow this domain into PiHole for Google, add this domain to the PiHole whitelist.
```
google-analytics.com
```

Obtained from here: https://github.com/GoodnessJSON/PiHole-Whitelist/blob/master/lists/optional-list.txt#L103

Guide I found to help out with this:
https://www.reddit.com/r/pihole/comments/hxlb4s/fitbit_app_and_pihole_issue/

