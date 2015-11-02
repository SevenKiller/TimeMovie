//
//  TabBarButton.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "TabBarButton.h"

@implementation TabBarButton

-(id)initWithTitle:(NSString *)title
             image:(NSString *)imageName
             frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //创建图片和Label
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 22)/2, 8, 22, 25)];
        imageView.image = [UIImage imageNamed:imageName];
        // 设置图片的拉伸模式
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 34, frame.size.width, 15)];
        label.text = title;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    
    return self;
}

@end
