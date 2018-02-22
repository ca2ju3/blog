---
title: "用Hugo建立自己的博客"
disqusIdentifier: fdsF34ff77
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

这个博客是个人博客系统，主要目的是为了分享技术历程，因此在博客系统上只想快速搭建，快速上线。因此，会大量使用第三方的成熟功能和系统。

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

**TODO**



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
使用hugo生成博客，如果不制定theme的话，那么hugo只会生成xml文件。解决的方式有两种，

* 一种是使用hugo命令的时候，带上参数 -t 如下，

```shell
hugo -t hyde
```

* 另一种是将{theme}目录下的layout和static文件分别复制到根目录的layout和static

## hugo i18n: no such file or directory
这个主要是由于缺失语言文件，需要将{theme}目录下的i18n复制到根目录。
