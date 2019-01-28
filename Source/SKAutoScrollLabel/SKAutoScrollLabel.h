//
//  SKAutoScrollLabel.h
//  CADisplayLinkeDemo
//
//  Created by ShevaKuilin on 2018/5/4.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

#import <UIKit/UIKit.h>

/** The following enumeration controls the scrolling direction of the text.
 */
typedef NS_ENUM(NSInteger, SK_AUTOSCROLL_DIRECTION){
    /**
     * @abstract Scroll from left to right
     */
    SK_AUTOSCROLL_DIRECTION_RIGHT,
    /**
     * @abstract Scroll from right to left
     */
    SK_AUTOSCROLL_DIRECTION_LEFT,
    /**
     * @abstract Scroll from bottom to top
     */
    SK_AUTOSCROLL_DIRECTION_TOP,
    /**
     * @abstract Scroll from top to bottom
     */
    SK_AUTOSCROLL_DIRECTION_BOTTOM
};

@interface SKAutoScrollLabel : UIView

/**
 *  Initializes an `SKAutoScrollLabel` object in current viewController.
 *
 *  This is the designated initializer.
 *
 *  @param textContent Fill in the text content that needs to be scrolled here.
 *  @param direction Direction of text content scrolling. The default type is SK_AUTOSCROLL_DIRECTION_RIGHT.
 */
- (instancetype)initWithTextContent:(NSString * _Nonnull)textContent
                      direction:(SK_AUTOSCROLL_DIRECTION)direction;

/**
 *  Initializes an `SKAutoScrollLabel` object of rich text type in current viewController.
 *
 *  This is the designated initializer.
 *
 *  @param attributedTextContent Fill in the rich text content that needs to be scrolled here.
 *  @param direction Direction of text content scrolling. The default type is SK_AUTOSCROLL_DIRECTION_RIGHT.
 */
- (instancetype)initWithAttributedTextContent:(NSAttributedString * _Nonnull)attributedTextContent
                                    direction:(SK_AUTOSCROLL_DIRECTION)direction;

/**
 *  Direction of text content scrolling.The default type is SK_AUTOSCROLL_DIRECTION_RIGHT.
 */
@property (nonatomic, assign) SK_AUTOSCROLL_DIRECTION direction;

/**
 *  The distance each frame moves.The default vaule is 1.0f.
 */
@property (nonatomic, assign) CGFloat pointsPerFrame;

/**
 *  The spacing of each scrolling label.The default vaule is 20.
 *
 *  @discussion When the text content is scrolling, it is actually the same label that does the repeated loop animation. This property
 *  determines the spacing between the label to be displayed and the label that will disappear each time the animation is repeated,
 *  that is, the spacing between the labels of the two looping animations.
 *
 */
@property (nonatomic, assign) NSUInteger labelSpacing;

/**
 *  Plain text content.
 */
@property (nonatomic, copy, nonnull) NSString *textContent;

/**
 *  Rich text content.
 */
@property (nonatomic, copy, nonnull) NSAttributedString *attributedTextContent;

/**
 *  Plain text color.
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 *  Plain text font.
 */
@property (nonatomic, strong) UIFont *font;

/**
 *  Plain text alignment. 
 */
@property (nonatomic) NSTextAlignment textAlignment;

/**
 *  Default YES. Enable gradients of lable boundaries to fade.
 */
@property (nonatomic, assign) BOOL enableFade;

/**
 *  Pause scrolling animation being played.
 */
- (void)pauseScroll;

/**
 *  Make a paused scrolling animation continue playing.
 */
- (void)continueScroll;

@end
