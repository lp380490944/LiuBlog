# NexT

> NexT is a high quality elegant [Hexo](http://hexo.io) theme. It is crafted from scratch, with love.


[Live Preview](http://notes.iissnan.com)

## Screenshots

* Desktop
![Desktop Preview](http://iissnan.com/nexus/next/desktop-preview.png)

* Sidebar

![Desktop Sidebar Preview](http://iissnan.com/nexus/next/desktop-sidebar-preview.png)

* Sidebar (Post details page)

![Desktop Sidebar Preview](http://iissnan.com/nexus/next/desktop-sidebar-toc.png)

* Mobile

![Mobile Preview](http://iissnan.com/nexus/next/mobile.png)


## Installation

1. Get it from GitHub

        $ git clone https://github.com/iissnan/hexo-theme-next themes/next

2. Add it to `_config.yml`

        theme: next


## Update

```shell
<<<<<<< HEAD
cd themes/next
git pull
```

### Theme configurations using Hexo data files [#328](https://github.com/iissnan/hexo-theme-next/issues/328)

Currently, it is not smooth to update NexT theme from pulling or downloading new releases. It is quite often running into conflict status when updating NexT theme via `git pull`, or need to merge configurations manually when upgrading to new releases.

 At present, NexT encourages users to store some options in site's `_config.yml` and other options in theme's `_config.yml`. This approach is applicable, but has some drawbacks:
1. Configurations are splited into two pieces
2. Users maybe confuse which place should be for options

In order to resolve this issue, NexT will take advantage of Hexo [Data files](https://hexo.io/docs/data-files.html). Because Data files is introduced in Hexo 3, so you need upgrade Hexo to 3.0 (or above) to use this feature.  

If you prefer Hexo 2.x, you can still use the old approach for configurations. NexT is still compatible with Hexo 2.x.

#### Benefits

With this feature, now you can put all your configurations into one place (`source/_data/next.yml`), you don't need to touch `next/_config.yml`. If there are any new options in new releases, you just need to copy those options from `next/_config.yml`, paste into `_data/next.yml` and set their values to whatever you want.

#### How to use this feature

1. Please ensure you are using Hexo 3 (or above)
2. Create an file named `next.yml` in site's `source/_data` directory (create `_data` directory if it did not exist)
3. Copy NexT theme options both in site's `_config.yml` and theme's `_config.yml` into `next.yml`.

=======
cd theme/next
git pull
```

>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec
## Features

### Multiple languages support, including: English / Russian / French / German / Simplified Chinese / Traditional Chinese.

Default language is English.

```yml
language: en
# language: zh-Hans
# language: fr-FR
# language: zh-hk
# language: zh-tw
# language: ru
<<<<<<< HEAD
=======
# language: ru
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec
# language: de
```

Set `language` field as following in site `_config.yml` to change to Chinese.

```yml
language: zh-Hans
```

### Comment support.

NexT has native support for `DuoShuo` and `Disqus` comment systems.

Add the following snippets to your `_config.yml`:

```yml
duoshuo:
  enable: true
  shortname: your-duoshuo-shortname
```

OR

```yml
<<<<<<< HEAD
disqus_shortname: your-disqus-shortname
=======
disqus:
   enable: true
   shortname: your-disqus-shortname
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec
```

### Tags page.

> Add a tags page contains all tags in your site.

- Create a page named `tags`

        hexo new page "tags"

- Edit tags page, set page type to `tags`.

        title: All tags
        date: 2014-12-22 12:39:04
        type: "tags"

- Add `tags` to theme `_config.yml`:

        menu:
          home: /
          archives: /archives
          tags: /tags
<<<<<<< HEAD

=======
          
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec
### Categories page.

> Add a categories page contains all categories in your site.

- Create a page named `categories`

        hexo new page "categories"

- Edit categories page, set page type to `categories`.

        title: All categories
        date: 2014-12-22 12:39:04
        type: "categories"

- Add `categories` to theme `_config.yml`:

        menu:
          home: /
          archives: /archives
          categories: /categories

### Social Media

NexT can automatically add links to your Social Media accounts:

```yml
social:
  GitHub: your-github-url
  Twitter: your-twitter-url
  Weibo: your-weibo-url
  DouBan: your-douban-url
  ZhiHu: your-zhihu-url
<<<<<<< HEAD
```
=======
``` 
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec

### Feed link.

> Show a feed link.

Set `rss` field in theme's `_config.yml`, as the following value:

1. `rss: false` will totally disable feed link.
2. `rss:  ` use sites' feed link. This is the default option.

    Follow the installation instruction in the plugin's README. After the configuration is done for this plugin, the feed link is ready too.

3. `rss: http://your-feed-url` set specific feed link.

### Up to 5 code highlight themes built-in.

NexT uses [Tomorrow Theme](https://github.com/chriskempson/tomorrow-theme) with 5 themes for you to choose from.
Next use `normal` by default. Have a preview about `normal` and `night`:

![Tomorrow Normal Preview](http://iissnan.com/nexus/next/tomorrow-normal.png)
![Tomorrow Night Preview](http://iissnan.com/nexus/next/tomorrow-night.png)

Head over to [Tomorrow Theme](https://github.com/chriskempson/tomorrow-theme) for more details.

## Configuration

NexT comes with few configurations.

```yml

# Menu configuration.
menu:
  home: /
  archives: /archives

# Favicon
favicon: /favicon.ico

# Avatar (put the image into next/source/images/)
# can be any image format supported by web browsers (JPEG,PNG,GIF,SVG,..)
avatar: /default_avatar.png

# Code highlight theme
# available: normal | night | night eighties | night blue | night bright
highlight_theme: normal

# Fancybox for image gallery
fancybox: true

# Specify the date when the site was setup
since: 2013

```

## Browser support

![Browser support](http://iissnan.com/nexus/next/browser-support.png)


## Contributing

Contribution is welcome, feel free to open an issue and fork. Waiting for your pull request.

[![hexo-image]][hexo-url]
[![bower-image]][bower-url]
[![jquery-image]][jquery-url]

[hexo-image]: http://img.shields.io/badge/Hexo-2.4+-2BAF2B.svg?style=flat-square
[hexo-url]: http://hexo.io
[bower-image]: http://img.shields.io/badge/Bower-*-2BAF2B.svg?style=flat-square
[bower-url]: http://bower.io
[jquery-image]: https://img.shields.io/badge/jquery-1.9-blue.svg?style=flat-square
[jquery-url]: http://jquery.com/
