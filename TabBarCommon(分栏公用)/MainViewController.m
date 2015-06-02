//
//  MainViewController.m
//  TabBarCommon(分栏公用)
//
//  Created by app27 on 14-7-15.
//  Copyright (c) 2014年 com.sk. All rights reserved.
//

#import "MainViewController.h"
#import "Tabbar1ViewController.h"
#import "Tabbar2ViewController.h"
#import "Tabbar3ViewController.h"
#import "Tabbar4ViewController.h"
#import "Tabbar5ViewController.h"
#import "BaseNavController.h"
#import "ItemView.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBar.hidden=YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self loadViewControllers];
    
    [self customTabBarView];
}

-(void)loadViewControllers
{
    Tabbar1ViewController * tabbar1=[[Tabbar1ViewController alloc]init];
    BaseNavController * tabbarNav1=[[BaseNavController alloc]initWithRootViewController:tabbar1];
    
    Tabbar2ViewController * tabbar2=[[Tabbar2ViewController alloc]init];
    BaseNavController * tabbarNav2=[[BaseNavController alloc]initWithRootViewController:tabbar2];
    
    Tabbar3ViewController * tabbar3=[[Tabbar3ViewController alloc]init];
    BaseNavController * tabbarNav3=[[BaseNavController alloc]initWithRootViewController:tabbar3];
    
    Tabbar4ViewController * tabbar4=[[Tabbar4ViewController alloc]init];
    BaseNavController * tabbarNav4=[[BaseNavController alloc]initWithRootViewController:tabbar4];
    
    Tabbar5ViewController * tabbar5=[[Tabbar5ViewController alloc]init];
    BaseNavController * tabbarNav5=[[BaseNavController alloc]initWithRootViewController:tabbar5];

    NSArray * viewControllers=@[tabbarNav1,tabbarNav2,tabbarNav3,tabbarNav4,tabbarNav5];
    [self setViewControllers:viewControllers animated:YES];
}

-(void)customTabBarView
{
    _tabbarBG=[[UIImageView alloc]initWithFrame:CGRectMake(0, kDeviceHeight-49, kDeviceWidth, 49)];
    _tabbarBG.userInteractionEnabled=YES;
    _tabbarBG.image=[UIImage imageNamed:@"nav_bg_all_1.jpg"];
    [self.view addSubview:_tabbarBG];
    
    _selectView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _tabbarBG.height/2.0-45.0/2, 50, 45)];
    _selectView.image = [UIImage imageNamed:@"selectTabbar_bg_all"];
    [_tabbarBG addSubview:_selectView];
    
    NSArray * imgs = @[@"home_icon_hot.png" , @"home_icon_popular.png" , @"home_icon_trending.png" ,@"home_icon_recent.png" ,@"home_icon_rec@2x.png"];
    NSArray * titles = @[@"寻医",@"养生",@"病例资讯",@"我的就诊",@"技巧"];
    int x = 0;
    for (int index = 0; index < 5; index ++) {
        ItemView * itemView = [[ItemView alloc]initWithFrame:CGRectMake(5+x, _tabbarBG.height/2.0-45.0/2, 50, 45)];
        itemView.tag = index;
        itemView.delegate=self;
        itemView.item.image = [UIImage imageNamed:imgs[index]];
        itemView.title.text=titles[index];
        itemView.title.textColor=[UIColor darkGrayColor];
        [_tabbarBG addSubview:itemView];
        
        x += 65;
    }
}

#pragma mark - ItemView Delegate
- (void)didItemView:(ItemView *)itemView atIndex:(NSInteger)index
{
    [UIView beginAnimations:nil context:NULL];
    _selectView.frame = CGRectMake(5+65*index, _tabbarBG.height/2-45.0/2, 50, 45);
    [UIView commitAnimations];
    self.selectedIndex=index;
}

@end
