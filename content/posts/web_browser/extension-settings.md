---
title: "Extension Settings"
date: 2025-10-05T03:18:11-04:00
draft: false
toc: false
images:
tags:
  - web-browser
---

I will have a list of some extension configs and tips in here

---

# uBlock Origin Blocklists
Add these into uBlock Origin under Settings -> My Filters  

Disable Google 'AI Mode':
https://www.reddit.com/r/uBlockOrigin/comments/1l4vpmj/remove_google_ai_mode/
```
! Google - Hide the "AI Mode" tab
www.google.*##[role="navigation"] [role="list"]>[role="listitem"]:has([href^="/search"][href*="&udm=50"])
```


