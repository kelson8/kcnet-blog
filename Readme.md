# KCNet Blog
This is a basic blog for KelsonCraft using Hugo and markdown.

To run this, you will need to download the latest version of [Hugo](https://github.com/gohugoio/hugo) and place it in the same folder as the repo.

This needs some submodules for the theme to work, to obtain those use this command: `git clone https://github.com/kelson8/kcnet-blog.git --recurse-submodules --recursive`

## Modifying the site
To modify the hello-friend-ng theme, I have copied the index.html, and a few other files from the theme into the `layouts` folder.

Anything that you want to modify from a theme, recreate the file structure, so for example copy `themes/hello-friend-ng/layouts/partials/logo.html` to `layouts/partials/logo.html` and modify it.

You can add posts to this by using this command:
* .\hugo.exe new content `content/posts/post_name.md`

## Launching the site
To launch this hugo site on Windows, I use Windows Terminal

Command: .\hugo.exe server -D

Launch and bind to local ip: \hugo.exe server -D --bind `ip-or-url` --baseURL `ip-or-url`

I now have scripts to run this on Windows `run-hugo.bat` and Linux (untested) `run-hugo.sh`

# TODO For site
* Update this to add some more blog posts, possibly host this on https://blog.kelsoncraft.net
* Setup static site build and test with NGINX or another web server.
* Setup [Giscus](https://giscus.app/) for comments on the posts with GitHub.

## Themes
Theme in use: [hello-friend-ng](https://themes.gohugo.io/themes/hugo-theme-hello-friend-ng/)

All themes added as submodules:
* [hello-friend-ng](https://themes.gohugo.io/themes/hugo-theme-hello-friend-ng/)
* [reimu](https://themes.gohugo.io/themes/hugo-theme-reimu/)

Look into these themes later:
* [hugo-blog-awesome](https://themes.gohugo.io/themes/hugo-blog-awesome/)

## License
I have decided to license the content such as the markdown files under the CC BY 4.0 license.

The code and scripts are licensed under the GPLv3 license.

- **Content** (Markdown files): [CC BY 4.0](Licenses/CC-BY-4.0.md)
- **Code and Scripts**: [GPLv3](Licenses/GPL-3.0.md)