//
//  SKAutoScrollLabel.m
//  CADisplayLinkeDemo
//
//  Created by ShevaKuilin on 2018/5/4.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

#import "SKAutoScrollLabel.h"

static const CGFloat kDefaultFadeLength = 7.f;

@interface SKAutoScrollLabel()

@property (nonatomic, strong) CADisplayLink *displayLinke;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *animationLabel;
@property (nonatomic, assign) NSUInteger layoutCount;

@end

@implementation SKAutoScrollLabel

#pragma mark - Initializes

- (instancetype)init {
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}

- (instancetype)initWithTextContent:(NSString * _Nonnull)textContent
                          direction:(SK_AUTOSCROLL_DIRECTION)direction {
    self = [super init];
    if (self) {
        [self _init];
        self.textContent = textContent;
        self.direction = direction;
    }
    return self;
}

- (instancetype)initWithAttributedTextContent:(NSAttributedString * _Nonnull)attributedTextContent
                                    direction:(SK_AUTOSCROLL_DIRECTION)direction {
    self = [super init];
    if (self) {
        [self _init];
        self.attributedTextContent = attributedTextContent;
        self.direction = direction;
    }
    return self;
}

- (void)_init {
    self.direction = SK_AUTOSCROLL_DIRECTION_RIGHT;
    self.pointsPerFrame = 1.0f;
    self.labelSpacing = 20;
    self.enableFade = YES;
}

- (void)initElements {
    self.clipsToBounds = true; // Make sure the label does not exceed the border of the container

    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = self.backgroundColor;
    [self addSubview:self.containerView];
    
    self.animationLabel = [[UILabel alloc] init];
    [self updateAnimationLabel];
    [self.containerView addSubview:self.animationLabel];
    
    self.animationLabel.frame = [self fixLabelFrameWithDirection:self.direction];
    // Set frame
    [self initContainerFrame];
    // If the text width exceeds the width of the container, copy the same view
    [self createRepeatLabel];
}

- (void)initContainerFrame {
    switch (self.direction) {
            case SK_AUTOSCROLL_DIRECTION_RIGHT:
            self.containerView.frame = CGRectMake(self.bounds.size.width - (self.animationLabel.bounds.size.width * 2 + self.labelSpacing),
                                                  0,
                                                  self.animationLabel.bounds.size.width * 2 + self.labelSpacing,
                                                  self.bounds.size.height);
            break;
            case SK_AUTOSCROLL_DIRECTION_LEFT:
            self.containerView.frame = CGRectMake(0,
                                                  0,
                                                  self.animationLabel.bounds.size.width * 2 + self.labelSpacing,
                                                  self.bounds.size.height);
            break;
            case SK_AUTOSCROLL_DIRECTION_TOP:
            self.containerView.frame = CGRectMake(self.bounds.origin.x,
                                                  self.bounds.origin.y,
                                                  self.bounds.size.width,
                                                  self.animationLabel.frame.size.height * 2 + self.labelSpacing);
            break;
            case SK_AUTOSCROLL_DIRECTION_BOTTOM:
            self.containerView.frame = CGRectMake(self.bounds.origin.x,
                                                  -(self.animationLabel.frame.size.height * 2 + self.labelSpacing - self.frame.size.height),
                                                  self.bounds.size.width,
                                                  self.animationLabel.bounds.size.height * 2 + self.labelSpacing);
            break;
            
        default:
            break;
    }
}

- (void)updateAnimationLabel {
    self.animationLabel.text = self.textContent;
    self.animationLabel.textColor = self.textColor;
    self.animationLabel.font = self.font;
    self.animationLabel.numberOfLines = 0;
    self.animationLabel.textAlignment = self.textAlignment;
    if (self.attributedTextContent) {
        self.animationLabel.attributedText = self.attributedTextContent;
    }
    [self.animationLabel sizeToFit];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.layoutCount < 1) {
        [self initElements];
        [self creatDisplayLink];
        self.layoutCount++;
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    if (!newWindow) {
        [self stopDisplayLinke];
    }
}

#pragma mark - Create repeatLabel

- (void)createRepeatLabel {
    if (self.animationLabel.bounds.size.width > self.bounds.size.width || self.animationLabel.bounds.size.height > self.bounds.size.height) {
        NSData *repeatLabelData = [NSKeyedArchiver archivedDataWithRootObject:self.animationLabel];// copy the animationLabel's data
        UILabel *repeatLabel = [NSKeyedUnarchiver unarchiveObjectWithData:repeatLabelData];
        
        if (self.direction == SK_AUTOSCROLL_DIRECTION_TOP || self.direction == SK_AUTOSCROLL_DIRECTION_BOTTOM) {
            repeatLabel.frame = CGRectMake(self.animationLabel.bounds.origin.x,
                                           self.animationLabel.frame.origin.y + self.animationLabel.bounds.size.height + self.labelSpacing,
                                           self.animationLabel.bounds.size.width,
                                           self.animationLabel.bounds.size.height);
            repeatLabel.center = CGPointMake(self.animationLabel.center.x, repeatLabel.center.y);
        } else {
            repeatLabel.frame = CGRectMake(self.animationLabel.frame.origin.x + self.animationLabel.bounds.size.width + self.labelSpacing,
                                           self.animationLabel.bounds.origin.y,
                                           self.animationLabel.bounds.size.width,
                                           self.animationLabel.bounds.size.height);
            repeatLabel.center = CGPointMake(repeatLabel.center.x, self.animationLabel.center.y);
        }
        
        [self.containerView addSubview:repeatLabel];
    }
}

#pragma mark - Fix the frame of the label based on the scroll direction

- (CGRect)fixLabelFrameWithDirection:(SK_AUTOSCROLL_DIRECTION)direction {
    if (direction == SK_AUTOSCROLL_DIRECTION_LEFT || direction == SK_AUTOSCROLL_DIRECTION_RIGHT) {
        return CGRectMake(0,
                          self.bounds.size.height / 2 - self.animationLabel.frame.size.height / 2,
                          self.animationLabel.frame.size.width,
                          self.animationLabel.frame.size.height);
    } else {
        CGRect frame = self.animationLabel.frame;
        NSDictionary *attributeDic = [NSDictionary dictionaryWithObjectsAndKeys:self.animationLabel.font, NSFontAttributeName, nil];;
        CGFloat wordWidth = self.animationLabel.font.pointSize;
        CGSize textContentSize = [self.animationLabel.text boundingRectWithSize:CGSizeMake(wordWidth, CGFLOAT_MAX)
                                                                        options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                                                     attributes:attributeDic
                                                                        context:nil].size;
        CGFloat wordHeight = textContentSize.height;
        if (direction == SK_AUTOSCROLL_DIRECTION_TOP) {
            frame.origin = CGPointMake(self.frame.size.width / 2 - wordWidth / 2, 0);
        } else {
            frame.origin = CGPointMake(self.frame.size.width / 2 - wordWidth / 2, 0);
        }
        frame.size = CGSizeMake(wordWidth, wordHeight);

        return frame;
    }
}

#pragma mark - DisplayLink control

- (void)creatDisplayLink {
    self.displayLinke = [CADisplayLink displayLinkWithTarget:self selector:@selector(processDisplayLink)];
    [self.displayLinke addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)processDisplayLink {
    CGRect frame = self.containerView.frame;
    CGFloat offsetX = self.animationLabel.bounds.size.width + self.labelSpacing;
    CGFloat offsetY = self.animationLabel.bounds.size.height + self.labelSpacing;
    CGFloat bottomDirectionY = -(offsetY - self.frame.size.height - self.labelSpacing);
    switch (self.direction) {
        case SK_AUTOSCROLL_DIRECTION_RIGHT:
            if (frame.origin.x >= -(offsetX - self.frame.size.width - self.labelSpacing)) {
                frame.origin.x = -(self.animationLabel.frame.size.width * 2 + self.labelSpacing - self.frame.size.width);
            } else {
                frame.origin.x += self.pointsPerFrame;
                if (frame.origin.x > -(offsetX - self.frame.size.width - self.labelSpacing)) {
                    frame.origin.x = -(offsetX - self.frame.size.width - self.labelSpacing);
                }
            }
            
            break;
        case SK_AUTOSCROLL_DIRECTION_LEFT:
            if (frame.origin.x <= -offsetX) {
                frame.origin.x = 0;
            } else {
                frame.origin.x -= self.pointsPerFrame;
                if (frame.origin.x < -offsetX) {
                    frame.origin.x = -offsetX;
                }
            }
            
            break;
        case SK_AUTOSCROLL_DIRECTION_TOP:
            if (frame.origin.y <= -offsetY) {
                frame.origin.y = 0;
            } else {
                frame.origin.y -= self.pointsPerFrame;
                if (frame.origin.y < -offsetY) {
                    frame.origin.y = -offsetY;
                }
            }
            
            break;
        case SK_AUTOSCROLL_DIRECTION_BOTTOM:
            if (frame.origin.y >= bottomDirectionY) {
                frame.origin.y = -(self.animationLabel.frame.size.height * 2 + self.labelSpacing - self.frame.size.height);
            } else {
                frame.origin.y += self.pointsPerFrame;
                if (frame.origin.y > bottomDirectionY) {
                    frame.origin.y = bottomDirectionY;
                }
            }
            break;
            
        default:
            break;
    }
    
    self.containerView.frame = frame;
    [self applyGradientMask];
}

- (void)stopDisplayLinke {
    [self.displayLinke invalidate];
    self.displayLinke = nil;
}

#pragma mark - Setter

- (void)setDirection:(SK_AUTOSCROLL_DIRECTION)direction {
    _direction = direction;
}

- (void)setPointsPerFrame:(CGFloat)pointsPerFrame {
    _pointsPerFrame = pointsPerFrame;
}

- (void)setLabelSpacing:(NSUInteger)labelSpacing {
    _labelSpacing = labelSpacing;
}

- (void)setTextContent:(NSString *)textContent {
    _textContent = textContent;
    [self updateAnimationLabel];
}

- (void)setAttributedTextContent:(NSAttributedString *)attributedTextContent {
    _attributedTextContent = attributedTextContent;
    [self updateAnimationLabel];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self updateAnimationLabel];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    [self updateAnimationLabel];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
    [self updateAnimationLabel];
}

- (void)setEnableFade:(BOOL)enableFade {
    _enableFade = enableFade;
}

#pragma mark - Scrolling animation control

- (void)pauseScroll {
    [self.displayLinke setPaused:true];
}

- (void)continueScroll {
    [self.displayLinke setPaused:false];
}

#pragma mark - Gradient fading

- (void)applyGradientMask {
    if (kDefaultFadeLength) {
        // Create gradient mask and disappear length
        CAGradientLayer *gradientMask = [CAGradientLayer layer];
        gradientMask.bounds = self.layer.bounds;
        gradientMask.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        gradientMask.shouldRasterize = YES;
        gradientMask.rasterizationScale = [UIScreen mainScreen].scale;
        
        CGFloat fadePoint = 0;
        if (self.direction == SK_AUTOSCROLL_DIRECTION_TOP || self.direction == SK_AUTOSCROLL_DIRECTION_BOTTOM) {
            gradientMask.startPoint = CGPointMake(CGRectGetMidX(self.frame), 0);
            gradientMask.endPoint = CGPointMake(CGRectGetMidX(self.frame), 1);
            fadePoint = kDefaultFadeLength / CGRectGetHeight(self.bounds);
        } else {
            gradientMask.startPoint = CGPointMake(0, CGRectGetMidY(self.frame));
            gradientMask.endPoint = CGPointMake(1, CGRectGetMidY(self.frame));
            fadePoint = kDefaultFadeLength / CGRectGetWidth(self.bounds);
        }
        
        // Set the gradient mask color and position
        id transparent = (id)[UIColor clearColor].CGColor;
        id opaque = (id)[UIColor blackColor].CGColor;
        gradientMask.colors = @[transparent, opaque, opaque, transparent];
        
        // Calculate fade
        NSNumber *leftFadePoint = @(fadePoint);
        NSNumber *rightFadePoint = @(1 - fadePoint);
        NSNumber *bottomFadePoint = self.enableFade ? @1:@0;
        if (!self.enableFade) {
            switch (self.direction) {
                case SK_AUTOSCROLL_DIRECTION_LEFT:
                    leftFadePoint = @0;
                    break;
                case SK_AUTOSCROLL_DIRECTION_RIGHT:
                    leftFadePoint = @0;
                    rightFadePoint = @1;
                    break;
                case SK_AUTOSCROLL_DIRECTION_TOP:
                    leftFadePoint = @0;
                    break;
                case SK_AUTOSCROLL_DIRECTION_BOTTOM:
                    leftFadePoint = @0;
                    rightFadePoint = @1;
                    break;
            }
        }
        // Give the result of the calculation to the mask
        gradientMask.locations = @[@0, leftFadePoint, rightFadePoint, bottomFadePoint];
        
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.layer.mask = gradientMask;
        [CATransaction commit];
    } else {
        // Remove gradient mask and fading length
        self.layer.mask = nil;
    }
}

@end
