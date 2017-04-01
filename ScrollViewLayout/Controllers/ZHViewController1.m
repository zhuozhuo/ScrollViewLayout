//
//  ZHViewController1.m
//  ScollViewLayout
//
//  Created by aimoke on 17/3/16.
//  Copyright © 2017年 zhuo. All rights reserved.
//

#import "ZHViewController1.h"

@interface ZHViewController1 ()

@end

@implementation ZHViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bottomLabel.text = @"给生活一个微笑，道路还在继续，不管未来有多远，微笑着走下去，做生活的主人，不做情绪的奴隶。给他人一个微笑，种下一个善念，收获一种良知;付出一份真诚，得到一份尊重;传递一份爱心，感受一份温暖。给自己一个微笑，让心情豁然开朗，不为昨天而懊恼，不为明天而迷茫，快乐而知足，宁静而致远。";
    _img1View.image = [UIImage imageNamed:@"img6"];
    _img2View.image = [UIImage imageNamed:@"img7"];
    _img3View.image = [UIImage imageNamed:@"img8"];
  
    // Do any additional setup after loading the view from its nib.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //self.containerViewHeightConstraint.constant = CGRectGetMaxY(self.bottomLabel.frame);
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
