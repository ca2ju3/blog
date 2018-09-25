---
title: "用Hugo建立自己的博客"
disqusIdentifier: BLUEICE_BLOG_HUGO
date: 2018-02-17
categories:
- tech
tags:
- tech
- hugo
---


<!--toc-->
<!--more-->

参考很多网上的资料后，终于使用hugo建立了一个简单的博客系统。在这个过程中遇到了很多问题。我建立博客的流程和遇到的问题都将记录在这篇文档里面。

# 安装

[官方文档]( https://gohugo.io/getting-started/installing/#linux)
有几种安装方式，一种是用apt-get，一种是snap，一种是源码包安装。
我推荐使用第三种方式。
[源码包](https://github.com/gohugoio/hugo/releases)

# 使用

我的博客使用的皮肤是[hugo-tranquilpeak-theme](https://github.com/kakawait/hugo-tranquilpeak-theme)

网上实在太多教程了，我主要是参考这个文章, [Hugo静态网站生成器中文教程](http://nanshu.wang/post/2015-01-31/)

这个博客是个人博客，主要目的是为了分享个人技术历程和一些日常，在博客系统的技术上，只想快速搭建，快速上线。因此，会大量使用第三方的成熟功能和系统。

# 部署到github.io
使用Github Pages会有一些[限制](https://help.github.com/articles/what-is-github-pages/#usage-limits) ，我的博客估计长时间都会在这个限制的范围内，因此没有太多的顾虑。Github Pages有两种，一种是用户主页，一种是项目主页。这里说的都是用户主页，并且使用的是master分支。

将Hugo生成的博客，部署到Github Pages，有以下几个步骤，

1. 新建一个项目，命名规则是{你的账号}.github.io

2. 把public文件夹下面的文件提交到{你的账号}.github.io这个项目

   参考，[Github pages的官方文档](https://help.github.com/articles/user-organization-and-project-pages/)

   ​

   除此之外，你可以自定义自己的域名。你只需要在{你的账号}.github.io这个项目的根目录新建一个CNAME文件，文件里面写上你的域名。然后，ping {你的账号}.github.io 获取博客的ip地址，最后，去到这个域名的管理后台，把这个ip和域名绑定在一起。

# 部署到coding.me

由于github访问在国内的访问速度比较慢，因此我将博客部署了一份到国内的coding.me。

coding.me同样支持静态网页的部署，不过有个局限就是需要升级为银牌会员，才能支持自定义域名。

1. 新建一个项目，命名规则是{你的账号}.coding.me;

2. 把public文件夹下面的文件提交到{你的账号}.coding.me这个项目。

参考，[coding官方文档](https://coding.net/help/doc/pages/creating-pages.html)

# 统计代码

## 文章统计

我在博客中使用的是 [不蒜子](http://busuanzi.ibruce.info/) 统计。这个统计代码比较简单，只需要将它的两行代码加入到你的博客的公共区域，就能实现计数。不过，它支持统计，没有接口可以提供，因此你也就没有办法做一些，比如阅读排行榜之类的功能了。

## 网站统计

这个不多说，[百度统计](http://tongji.baidu.com/)和[谷歌统计](http://www.google.cn/webmasters/)。

# 博客评论

一些评论系统在国内都上不了。最终选择的是gitment，站在巨人的肩膀上。不过，gitment要用起来比较坎坷。它将每个博文转换成，你设定好的的github repository里面的issue，评论就是对这个issue的comment。因此，会有一下几点，

1. 要选择一个repository或者新建一个repository作为你的博客评论的载体；
2. 每个博文需要[GitHub Setting](https://github.com/settings/developers)创建一个OAuth Apps，其中**Homepage URL
**和**Authorization callback URL**都填写博客的url，如果是github page，URL应该是XXXX.github.io，如果是自己的域名，那么填写自己购买的域名；
3. 将以上信息填写到config.toml对应的配置里面，有些theme可能没有内置gitment，那你就要自己折腾一下了；
4. 访问自己的博客，这里最好是部署之后，访问真实的博客地址，而不是本地的localhost；
5. 第一次访问，应该会出现Error: Comments Not Initialized，那是因为还没有在对应的repository里面创建跟博客相关的issue，建议步骤：a. 用chrome或者Firefox的隐身(incognito)窗口； b. 访问你自己的还没有初始化评论系统的博文； c. 点击评论区的github icon； d. 接着按照页面步骤。That's it. Have Fun，lol.

在gitment的部署过程中，参考很多网上的文章，只遇到了上面这一个问题。

# cdn
This phase still remaining a lot of works have **TODO**, lol.

[国内](https://zhuanlan.zhihu.com/p/28292763)

[我自己用的cdn](cloudflare.com)




# 搭建过程中，遇到的问题
## 为什么没有生成public文件夹

```shell
hugo new file.md
```
使用上面这条命令生成markdown文件的话，会生产一个属性为draft的文件。需要将文档中的draft: true删除或者使用hugo命令的时候，带上参数--buildDrafts 如下，

```shell
hugo --buildDrafts
```

## 为什么使用hugo生成博客的过程中，生成的是xml文件，而不是html文件
使用hugo生成博客，如果不指定theme的话，那么hugo只会生成xml文件。解决的方式有两种，

* 一种是使用hugo命令的时候，带上参数 -t 如下，

```shell
hugo -t hyde
```

* 另一种是将{theme}目录下的layout和static文件分别复制到根目录的layout和static

## hugo i18n: no such file or directory
这个主要是由于缺失语言文件，需要将{theme}目录下的i18n复制到根目录。
