//
//  TabBarButton.h
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarButton : UIButton

/**
 *  初始化方法
 *
 *  @param title     按钮下面的文字
 *  @param imageName 按钮上部图片名
 *  @param frame     图片尺寸
 */
-(id)initWithTitle:(NSString *)title
             image:(NSString *)imageName
             frame:(CGRect)frame;

@end
