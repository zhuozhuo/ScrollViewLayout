#UIScrollView 约束剖析

>`UIScrollView` 约束设置曾一直困扰着iOS开发小伙伴们。趁着这次和和圈内几位小伙伴们分享我在做`UIScrollView`约束的一些心得，顺便写出来以便大家参考。为了方便大家理解后续的内容，首先我们思考以下几点。

1. 我们在为`UIScrollView`设置的上下左右约束，是设置的它Content约束还是`UIScrollView`本身边界的约束？
2. `UIScrollView`是如何计算出`contentSize`的？
3. `UIScrollView`是否一定需要一个容器作为参考？


