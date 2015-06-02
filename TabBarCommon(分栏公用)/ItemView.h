//
//  ItemView.h
//  Movie
//
//  Created by Mini on 14-6-17.
//  Copyright (c) 2014年 com.imit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemView;
@protocol ItemViewDelegate <NSObject>
@optional
-(void)didItemView:(ItemView * )itemView    atIndex:(NSInteger)index;
@end


@interface ItemView : UIView
{
    @private
    UIImageView * _item;
    UILabel          * _title;
}
@property (nonatomic,readonly) UIImageView * item;
@property (nonatomic,readonly) UILabel * title;
@property (nonatomic,retain) id <ItemViewDelegate> delegate;
@end
