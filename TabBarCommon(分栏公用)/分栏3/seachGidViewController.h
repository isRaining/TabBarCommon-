//
//  seachGidViewController.h
//  TabBarCommon(分栏公用)
//
//  Created by Code on 15/1/5.
//  Copyright (c) 2015年 com.sk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface seachGidViewController : UIViewController<UISearchBarDelegate>
{
    NSDictionary * dictionary;
}
@property (nonatomic , assign)NSInteger index;
@property (nonatomic , retain)UISearchBar * searchBar;

@end
