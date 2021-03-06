//
//  XMGTabBar.m
//  5期-百思不得姐
//
//  Created by xiaomage on 15/11/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "XMGTabBar.h"

@interface XMGTabBar()
/** 中间的发布按钮 */
@property (nonatomic, weak) UIButton *publishButton;
@end

@implementation XMGTabBar

#pragma mark - 懒加载
/** 发布按钮 */
- (UIButton *)publishButton
{
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    /**** 按钮的尺寸 ****/
    CGFloat buttonW = self.xmg_width / 5;
    CGFloat buttonH = self.xmg_height;
    
    /**** 设置所有UITabBarButton的frame ****/
    CGFloat tabBarButtonY = 0;
    // 按钮索引
    int tabBarButtonIndex = 0;
    
    for (UIView *subview in self.subviews) {
        // 过滤掉非UITabBarButton
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        
        // 设置frame
        CGFloat tabBarButtonX = tabBarButtonIndex * buttonW;
        if (tabBarButtonIndex >= 2) { // 右边的2个UITabBarButton
            tabBarButtonX += buttonW;
        }
        subview.frame = CGRectMake(tabBarButtonX, tabBarButtonY, buttonW, buttonH);
        
        // 增加索引
        tabBarButtonIndex++;
        
//        UIControl *tabBarButton = (UIControl *)subview;
//        [tabBarButton addTarget:self action:@selector(tabBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    /**** 设置中间的发布按钮的frame ****/
    self.publishButton.xmg_width = buttonW;
    self.publishButton.xmg_height = buttonH;
    self.publishButton.xmg_centerX = self.xmg_width * 0.5;
    self.publishButton.xmg_centerY = self.xmg_height * 0.5;
}

#pragma mark - 监听
- (void)publishClick
{
    XMGLogFunc
}

//- (void)tabBarButtonClick
//{
//    XMGLogFunc
//}

@end
