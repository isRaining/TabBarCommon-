//
//  Tabbar3ViewController.m
//  TabBarCommon(分栏公用)
//
//  Created by app27 on 14-7-15.
//  Copyright (c) 2014年 com.sk. All rights reserved.
//

#import "Tabbar3ViewController.h"
#import "seachGidViewController.h"
@interface Tabbar3ViewController ()

@end

@implementation Tabbar3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-100) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView=[[UIView alloc]init];
    _tableView.scrollEnabled=NO;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellidentifer = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidentifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifer];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text=@"沪深股市";
    }else if (indexPath.row == 1){
        cell.textLabel.text=@"香港股市";
    }else if (indexPath.row == 2){
        cell.textLabel.text=@"美国股市";
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    seachGidViewController * seachView=[[seachGidViewController alloc]init];
    seachView.index=[indexPath row];
    [self.navigationController pushViewController:seachView animated:YES];
}
@end
