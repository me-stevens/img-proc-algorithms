# Image processing algorithms site

This is the dedicated site of the repo.

The approach is very similar to the one I used for my other site, :octocat: [Numerical Recipes applied to Thermodynamics](https://github.com/me-stevens/nr-thermo/tree/gh-pages). Which means, it uses pages instead of posts.

There is a little change though: Now my items are not links, so I don't need to have an `index.html` page under every category folder. If anybody goes to `siteurl/category` they would just find my error page.

This page uses Jekyll and a mix of HMTL5 Boilerplate and my own stuff.

* prefix-free by Lea Verou
* prism by Lea Verou
* MathJax
* Arvo
* Internal floating navigation

Since in this site every page has a "Table of contents" for internal navigation, I decided to place it at the bottom. That way, mobile users don't have to skip to the content, and desktop users can access it through `position: fixed` (the `nav` element appears to be floating).
