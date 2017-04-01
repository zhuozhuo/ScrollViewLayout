//
//  ZHViewController2.h
//  ScollViewLayout
//
//  Created by aimoke on 17/3/20.
//  Copyright © 2017年 zhuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *showScrollView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewHeightConstraint;

@end
