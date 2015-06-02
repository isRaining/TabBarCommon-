//
//  seachGidViewController.m
//  TabBarCommon(分栏公用)
//
//  Created by Code on 15/1/5.
//  Copyright (c) 2015年 com.sk. All rights reserved.
//
#define URLhead @"http://web.juhe.cn:8080/finance/stock/"
#import "seachGidViewController.h"
#import "AFHTTPRequestOperationManager.h"
@interface seachGidViewController ()

@end

@implementation seachGidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 40)];
    _searchBar.delegate=self;
    if (_index == 0) {
        _searchBar.placeholder=@"hs";
    }else if (_index == 1){
        _searchBar.placeholder=@"hk";
    }else{
        _searchBar.placeholder=@"usa";
    }
    [self.view addSubview:_searchBar];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(40, 50, kDeviceWidth-80, 40);
    [btn setTitle:@"搜索" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getNetWork) forControlEvents:UIControlEventTouchDown];
    [btn setBackgroundColor:[UIColor colorWithRed:0.8 green:0.9 blue:.1 alpha:1]];
    btn.layer.cornerRadius=15;
    [self.view addSubview:btn];
}

-(void)getNetWork
{
    NSString * str=@"";
    if (_index == 0) {
        str=[NSString stringWithFormat:@"%@%@",@"http://web.juhe.cn:8080/finance/stock/",@"hs"];
    }else if (_index == 1){
        str=[NSString stringWithFormat:@"%@%@",@"http://web.juhe.cn:8080/finance/stock/",@"hk"];
    }else if (_index == 2){
        str=[NSString stringWithFormat:@"%@%@",@"http://web.juhe.cn:8080/finance/stock/",@"usa"];
    }
    NSDictionary *dic =nil;
//  @{@"num":str,@"key":@"7e636c6b21a57319c8e4af9b2bef9bd7"};
    NSLog(@"dic==%@",dic);
    AFHTTPRequestOperationManager *Gu = [AFHTTPRequestOperationManager manager];
    Gu.requestSerializer = [AFJSONRequestSerializer serializer];
    
    dictionary=[[NSDictionary alloc]init];
    
    [Gu GET:[NSString stringWithFormat:@"%@?key=7e636c6b21a57319c8e4af9b2bef9bd7&gid=%@",str,_searchBar.text] parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject===%@",responseObject);
        dictionary=(NSDictionary *)responseObject;
        NSLog(@"%@",dictionary);
    }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"失败%@",error);
      }];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
//    [self getNetWork];
}

@end
