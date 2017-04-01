//
//  ZHViewController4.m
//  ScollViewLayout
//
//  Created by aimoke on 17/3/28.
//  Copyright © 2017年 zhuo. All rights reserved.
//

#import "ZHViewController4.h"
#import "UIView+ZHCMessages.h"
#import <HealthKit/HealthKit.h>
@interface ZHViewController4 ()

@end

@implementation ZHViewController4

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
