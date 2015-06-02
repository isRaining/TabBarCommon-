//
//  MainViewController.h
//  TabBarCommon(分栏公用)
//
//  Created by app27 on 14-7-15.
//  Copyright (c) 2014年 com.sk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemView.h"
@interface MainViewController : UITabBarController<ItemViewDelegate>
{
    UIImageView * _tabbarBG;
    UIImageView * _selectView;
}
@end
