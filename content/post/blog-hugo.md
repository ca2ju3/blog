---
title: "用Hugo建立自己的博客"
disqusIdentifier: hugoblog
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
参考, [Hugo静态网站生成器中文教程](http://nanshu.wang/post/2015-01-31/)

# 搭建过程中，遇到的问题
## 为什么没有生产public文件夹

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
这个主要是由于缺失语言文件，需要将{theme}目录下的i18n复制到跟目录。
