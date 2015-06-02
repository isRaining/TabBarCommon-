//
//  Tabbar1ViewController.m
//  TabBarCommon(分栏公用)
//
//  Created by app27 on 14-7-15.
//  Copyright (c) 2014年 com.sk. All rights reserved.
//

#import "Tabbar1ViewController.h"

@interface Tabbar1ViewController ()

@end

@implementation Tabbar1ViewController

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
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    webView.backgroundColor=[UIColor clearColor];
    webView.delegate=self;
    NSURL *url = [[NSURL alloc]initWithString:@"http://zhangzhengyu.sinaapp.com/?p=169"];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:webView];
    
	// Do any additional setup after loading the view.
}

//几个代理方法

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"webViewDidStartLoad");
    
}

- (void)webViewDidFinishLoad:(UIWebView *)web{
    
    NSLog(@"webViewDidFinishLoad");
    
}

-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
    
    NSLog(@"DidFailLoadWithError");
    
}

@end
