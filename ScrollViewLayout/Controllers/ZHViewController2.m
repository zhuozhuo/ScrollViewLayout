//
//  ZHViewController2.m
//  ScollViewLayout
//
//  Created by aimoke on 17/3/20.
//  Copyright © 2017年 zhuo. All rights reserved.
//

#import "ZHViewController2.h"

@interface ZHViewController2 ()

@end

@implementation ZHViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"I have a dream";
    self.detailLabel.text = @"There are those who are asking the devotees of civil rights, \"When will you be satisfied?\" We can never be satisfied as long as the Negro is the victim of the unspeakable horrors of police brutality. We can never be satisfied as long as our bodies, heavy with the fatigue of travel, cannot gain lodging in the motels of the highways and the hotels of the cities. We cannot be satisfied as long as the Negro's basic mobility is from a smaller ghetto to a larger one. We can never be satisfied as long as our children are stripped of their selfhood and robbed of their dignity by signs stating \"for whites only.\" We cannot be satisfied as long as a Negro in Mississippi cannot vote and a Negro in New York believes he has nothing for which to vote. No, no, we are not satisfied, and we will not be satisfied until \"justice rolls down like waters, and righteousness like a mighty stream.\"/nI am not unmindful that some of you have come here out of great trials and tribulations. Some of you have come fresh from narrow jail cells. And some of you have come from areas where your quest -- quest for freedom left you battered by the storms of persecution and staggered by the winds of police brutality. You have been the veterans of creative suffering. Continue to work with the faith that unearned suffering is redemptive. Go back to Mississippi, go back to Alabama, go back to South Carolina, go back to Georgia, go back to Louisiana, go back to the slums and ghettos of our northern cities, knowing that somehow this situation can and will be changed.";
        // Do any additional setup after loading the view from its nib.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.containerViewHeightConstraint.constant = CGRectGetMaxY(self.detailLabel.frame);
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
