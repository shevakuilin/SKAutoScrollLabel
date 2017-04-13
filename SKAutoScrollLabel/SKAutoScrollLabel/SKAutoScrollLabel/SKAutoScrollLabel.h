//
//  SKAutoScrollLabel.h
//  SKAutoScrollLabel
//
//  Created by shevchenko on 17/4/10.
//  Copyright © 2017年 shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SK_AUTOSCROLL_DIRECTION){
    SK_AUTOSCROLL_DIRECTION_RIGHT,// 向右滚动
    SK_AUTOSCROLL_DIRECTION_LEFT,// 向左滚动
    SK_AUTOSCROLL_DIRECTION_TOP,// 向上滚动
    SK_AUTOSCROLL_DIRECTION_BOTTOM// 向下滚动
};

@interface SKAutoScrollLabel : UIView

@property (nonatomic, assign) SK_AUTOSCROLL_DIRECTION direction;
@property (nonatomic, assign) CGFloat scrollSpeed;// 滚动速度, 默认30
@property (nonatomic) NSTimeInterval autoScrollInterval;// 自动滚动的时间间隔，默认1.5
@property (nonatomic, assign) NSUInteger labelSpacing;// 滚动的label的间距，默认20

@property (nonatomic, readonly) BOOL scrolling;// 是否滚动

@property (nonatomic, copy, nullable) NSString * text;
@property (nonatomic, copy, nullable) NSAttributedString * attributedText;
@property (nonatomic, strong, nonnull) UIColor * textColor;
@property (nonatomic, strong, nonnull) UIFont * font;
@property (nonatomic, strong, nullable) UIColor * shadowColor;
@property (nonatomic) CGSize shadowOffset;
@property (nonatomic) NSTextAlignment textAlignment;

- (void)setText:(NSString * __nullable)text refreshLabels:(BOOL)refresh;

- (void)setAttributedText:(NSAttributedString * __nullable)theText refreshLabels:(BOOL)refresh;


@end
