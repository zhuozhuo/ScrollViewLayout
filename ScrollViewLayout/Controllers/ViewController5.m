//
//  ViewController5.m
//  ScrollViewLayout
//
//  Created by aimoke on 17/4/1.
//  Copyright © 2017年 zhuo. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGFloat viewWidth = CGRectGetWidth(self.view.bounds);
    CGFloat scrollViewWidth = CGRectGetWidth(self.showScrollView.bounds);
    CGFloat contentSizeWidth = self.showScrollView.contentSize.width;
    NSLog(@"viewWidth:%f--- scrollViewWidth:%f-----contentSizeWidth:%f",viewWidth,scrollViewWidth,contentSizeWidth);
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
