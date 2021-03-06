---
title: "负载均衡"
disqusIdentifier: BLUEICE_LOAD_BALANCE_1
date: 2018-03-16
categories:
- tech
tags:
- tech
- NETWORK
---

<!--toc-->
<!--more-->

开篇先来一个思考题，基于http协议和基于tcp协议的系统，用人话说，就是你在逛网页和在聊天，这些系统的负载均衡有什么不同。**TODO**

# 什么是负载均衡

讲个故事，在车站买过票的伙伴们都知道，如果车站只有一个卖票的窗口，遇到高峰繁忙时期，一些节假日的时候，通常都会排起非常长的队伍。况且人有三急，卖票的工作人员去上个厕所，那么这个窗口就歇菜了。不过，如果车站能开多几个窗口，把购票的人群分别分派到不同的窗口，那么购票的效率就可以得到一定的提升。负载均衡器就像车站的一个工作人员，告诉需要买票的伙伴们，去哪个窗口购票会更快。

wiki和百度百科上教科书式的答案是：负载均衡（Load Balance）是互联网系统的一个关键的部件，它负责将客户端的大量请求根据一定的规则分发到后端的服务器。它有硬件负载均衡和软件负载均衡。硬件负责均衡，是在外部网络和内部服务器集群之间的负载均衡器，比如F5，它的优势是性能高，功能比较强大，并且独立于操作系统，安全性比较高，不过它的价格非常昂贵，系统升级比较麻烦，并且售后服务的成本比较高。

条条大路通罗马，不过有些人，天生在罗马。如果你就是那个罗马人，那么直接购买并部署负载均衡器，简单完事就行了。如果你不是那个罗马人，请接着往下看。

## 软件[负载均衡](https://baike.baidu.com/item/%E8%B4%9F%E8%BD%BD%E5%9D%87%E8%A1%A1)，

> 是指在一台或者多台服务器的操作系统上安装一个或者多个负载均衡软件来实现负载均衡，比如非常著名的LVS，NGINX等。

服务端在收到大量客户端请求后，可以在[OSI模型](http://blueice.io/post/osi)中的二层，三层，四层和七层进行流量分发。

### [二层负载均衡](http://blueice.io/post/load_balance_mac/)
在OSI模型中属于数据链路层，二层负载均衡是基于MAC(Media Access Control)地址的负载均衡。在数据链路层，负载均衡器和服务器，必须同处在一个广播域。
