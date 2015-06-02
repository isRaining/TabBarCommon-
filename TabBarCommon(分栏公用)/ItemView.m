//
//  ItemView.m
//  Movie
//
//  Created by Mini on 14-6-17.
//  Copyright (c) 2014年 com.imit. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initSubviews];
        [self addGesture];
    }
    return self;
}

-(void)initSubviews
{
    _item = [[UIImageView alloc]initWithFrame:
    CGRectMake(self.width/2.0-11, 5, 22, 22)];
    _item.contentMode = UIViewContentModeScaleAspectFit;
    _item.userInteractionEnabled = YES;
    [self addSubview:_item];
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, _item.bottom + 5, self.width, 10)];
    _title.backgroundColor = [UIColor clearColor];
    _title.textColor = [UIColor whiteColor];
    _title.font= [UIFont boldSystemFontOfSize:10];
    _title.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_title ];
}
-(void )addGesture{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didItemView:)];
    [self addGestureRecognizer:tap];
}

#pragma  mark - Target Actions
-(void)didItemView:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(didItemView:atIndex:)]) {
        [self.delegate didItemView:self atIndex:self.tag];
    }
}
@end
