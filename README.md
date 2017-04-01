#UIScrollView 约束剖析

>`UIScrollView` 约束设置曾一直困扰着iOS开发小伙伴们。趁着这次和几位小伙伴们分享我在做`UIScrollView`约束的一些心得，顺便写出来以便大家参考。

先看展示效果:


![111.gif](http://upload-images.jianshu.io/upload_images/2926059-f04e1efb90c3e5ba.gif?imageMogr2/auto-orient/strip)

为了方便大家理解后续的内容，首先我们思考以下几点:

1. 我们在为`UIScrollView`设置的上下左右约束，是设置的它`Content`约束还是`UIScrollView`本身边界的约束？
2. `UIScrollView`是如何计算出`contentSize`的？
3. `UIScrollView`是否一定需要一个容器作为参考？

对于第一个问题，我们先做个测试：新建一个`UIViewController`带上`Xib`,在其`View`中我们放置一个`UIScrollView`,如下图所示：

![屏幕快照 ](http://upload-images.jianshu.io/upload_images/2926059-1c7daa043ecb641e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

上图中我们的左右边界都超出了`View`20个像素。如果为`UIScrollView`设置的左右约束，是设置的它`Content`相对约束。那么我们可以推断出`contentSize`应该是超过`View`宽度的大小也就是说左右可以滑动。

运行结果：


![contentSize.gif](http://upload-images.jianshu.io/upload_images/2926059-80744771309a2f72.gif?imageMogr2/auto-orient/strip)

我们打印下`View`的`Frame`宽度，`UIScrollView`的`Frame`宽度和`contentSize`的宽度进一步确认下：（我用的是iPhone 6模拟器）


```objective-c
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGFloat viewWidth = CGRectGetWidth(self.view.bounds);
    CGFloat scrollViewWidth = CGRectGetWidth(self.showScrollView.bounds);
    CGFloat contentSizeWidth = self.showScrollView.contentSize.width;
    NSLog(@"viewWidth:%f--- scrollViewWidth:%f-----contentSizeWidth:%f",viewWidth,scrollViewWidth,contentSizeWidth);
}
```
终端Log：
```
ScrollViewLayout[24613:15651720] viewWidth:375.000000--- 

scrollViewWidth:415.000000-----contentSizeWidth:0.000000
```

我们看到`contentSize`为0，`UIScrollView`的`Frame`宽度为415即为375+20+20。由此对于第一个问题，我们有了答案：

**我们在为`UIScrollView`设置的上下左右约束，是设置的`UIScrollView`本身边界的约束。而非设置的它`Content`约束**

>对于后面两个问题，我们先看几种设置`UIScrollView` 约束的方法,这里我们只展示上下滑动的情况。

###添加一个容器作为参考视图contentSize自动计算

步骤我就不详细说明了，容器中我们简单的添加几张图片和一个`Label`到容器视图中具体如下图所示：

![屏幕快照](http://upload-images.jianshu.io/upload_images/2926059-406ef7b6f89fdcb9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

上图中当你拖动`containerView`到`UIScrollView`中时，设置完前后左右的约束和宽度约束后会报错，不过不要担心，那是因为此时`UIScrollView`还不能计算出它的`contentSize`如果你看着不舒服，可以把`containerView`的高度约束先固定，不过记得后面要删除。

这里重点讲下，如果你想要高度自动计算，你必须的设置最下面的控件`Label`的`bottom`约束到`containerView`之间的距离。

###添加一个容器作为参考视图contentSize手动计算

前面一个例子中，我们必须得设置最下面的控件`Label`的`bottom`约束。试想下如果我们界面中最下面一个控件例如`Label` 离底部很长，但是我们又不想设置那样长的距离，我们又想`Label`可以根据内容向下扩展，如果文字很多，也许会超过屏幕底部。这时我们该如何设置`UIScrollView`的约束呢，这时我们需要设置`containerView`的高度约束并作为一个属性变量。界面如下：

![屏幕快照](http://upload-images.jianshu.io/upload_images/2926059-fefc8565808c4e99.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

在我们需要改变`contentSize`时，我们手动计算并赋值即可例如：

```objective-c
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.containerViewHeightConstraint.constant = CGRectGetMaxY(self.detailLabel.frame);
}
```

###不添加容器直接在`UIScrollView`中添加子视图

视图添加过程不详细介绍了，添加完毕后的视图如下所示：
我们希望黄色`View`的高度可以随其里面的`Label`高度而改变。
![屏幕快照](http://upload-images.jianshu.io/upload_images/2926059-32e983757cd54029.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>前面两个例子中我们都设置了容器的宽度约束和`UIScrollView`的宽度相同而`UIScrollView`的宽度和`UIViewController`的`View`相同。`UIScrollView`的高度，第一个例子是根据容器里面的子视图计算出容器的高度，第二个例子高度是手动计算，然后推断出`UIScrollView`的`contentSize`。第三个例子中我们也设置了最后一个`View`的宽度和`UIScrollView`的宽度相同，高度也是由`UIScrollView`子视图推断而出。

**因此我们推断出`UIScrollView`的`contentSize`是由其子视图决定。**

对于第三个问题：我们可以看出，`UIScrollView`可以不需要一个与之边界相同的容器作为参考。但是其子视图一定得能够计算出其宽度和高度。

### 纯代码编写自动滑动

这里有两种方法，一种是需要容器，一种不要容器，代码如下。

```
- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor greenColor];
    [self.view zhc_pinAllEdgesOfSubview:self.scrollView];
    //[self addSubViewToScrollView];
    
     self.containerView = [[UIView alloc]init];
     self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
     self.containerView.backgroundColor = [UIColor yellowColor];
     [self.scrollView addSubview:self.containerView];
     [self.scrollView zhc_pinAllEdgesOfSubview:self.containerView];
     [self.scrollView zhc_pinSubview:self.containerView toEdge:NSLayoutAttributeHeight withConstant:0.0];
    [self addSubViewToContainerView];
     // Do any additional setup after loading the view.

    
}



-(void)addSubViewToScrollView
{
    UIView *lastView = self.scrollView;
    UIView *superView = self.scrollView;
    NSInteger count = 5;
    for (NSInteger i=0; i< count; i++) {
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.backgroundColor = [UIColor blueColor];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.translatesAutoresizingMaskIntoConstraints = NO;
        NSString *imgName = [NSString stringWithFormat:@"img%ld",(i+1)];
        imgView.image = [UIImage imageNamed:imgName];
        [superView addSubview:imgView];
       
        [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeTop withConstant:0.0];
        [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeBottom withConstant:0.0];
        [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeHeight withConstant:0.0];
        [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeWidth withConstant:0.0];
        if (i==0) {
            [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeLeft withConstant:0.0];
        }else{
            NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
            [superView addConstraint:constraint];
        }
        if (i == (count-1)){
            [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeTrailing withConstant:0.0];
        }
        lastView = imgView;
        
    }
}


-(void)addSubViewToContainerView
{
    UIView *lastView = self.containerView;
    UIView *superView = self.containerView;
    NSInteger count = 5;
    CGFloat imgWidth = [UIScreen mainScreen].bounds.size.width;
    for (NSInteger i=0; i< count; i++) {
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.backgroundColor = [UIColor blueColor];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.translatesAutoresizingMaskIntoConstraints = NO;
        NSString *imgName = [NSString stringWithFormat:@"img%ld",(i+1)];
        imgView.image = [UIImage imageNamed:imgName];
        [superView addSubview:imgView];
        
        [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeTop withConstant:0.0];
        [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeBottom withConstant:0.0];
        [imgView zhc_pinSelfToEdge:NSLayoutAttributeWidth withConstant:imgWidth];
        if (i==0) {
            [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeLeft withConstant:0.0];
        }else{
            NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
            [superView addConstraint:constraint];
        }
        if (i == (count-1)){
            [superView zhc_pinSubview:imgView toEdge:NSLayoutAttributeTrailing withConstant:0.0];
        }
        lastView = imgView;
        
    }

}

```

[**Demo下载**](https://github.com/zhuozhuo/ScrollViewLayout)