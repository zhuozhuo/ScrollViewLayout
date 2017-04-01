//
//  ZHRootTableViewController.m
//  ScollViewLayout
//
//  Created by aimoke on 17/3/16.
//  Copyright © 2017年 zhuo. All rights reserved.
//

#import "ZHRootTableViewController.h"
#import "ZHViewController1.h"
#import "ZHViewController2.h"
#import "ZHViewController3.h"
#import "ZHViewController4.h"
#import "ViewController5.h"


@interface ZHRootTableViewController (){
    NSArray *titles;
}

@end

@implementation ZHRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    titles = @[@"容器视图+高度自动",@"容器视图+高度手动",@"无容器视图+高度自动",@"纯代码滑动图片",@"测试"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return titles.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightDetailCellIdentifier" forIndexPath:indexPath];
    NSString *title = [titles objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    return cell;
}


#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            ZHViewController1 *VC1 = [[ZHViewController1 alloc]initWithNibName:@"ZHViewController1" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:VC1 animated:YES];
        }
            
            break;
        case 1:{
            ZHViewController2 *VC2 = [[ZHViewController2 alloc]initWithNibName:@"ZHViewController2" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:VC2 animated:YES];
        }
            break;
        case 2:{
            ZHViewController3 *VC3 = [[ZHViewController3 alloc]initWithNibName:@"ZHViewController3" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:VC3 animated:YES];
        }
            break;
        case 3:{
            ZHViewController4 *VC4 = [[ZHViewController4 alloc]init];
            [self.navigationController pushViewController:VC4 animated:YES];
        }
            break;
        case 4:{
            ViewController5 *vc = [[ViewController5 alloc]initWithNibName:@"ViewController5" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
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
