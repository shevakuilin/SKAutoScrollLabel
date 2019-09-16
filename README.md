# SKAutoScrollLabel

![](https://img.shields.io/badge/platform-iOS-green.svg)
![](https://img.shields.io/badge/pod-v1.6.0.beta.1-blue.svg)
![](https://img.shields.io/badge/language-ObjectiveC-purple.svg)
![](https://img.shields.io/badge/version-v0.0.6-red.svg)

Automatically scrolling UILabel with both horizontal/vertical MARQUEE effects and gradient gradients on the edges.Gradient fading is used on the edge of the scroll to solve the problem of the hard edges of the rolling edge. The overall effect is a natural and easy to use.


# Feature

- Supports automatic scrolling in four directions: up, down, left, and right.
- Freely controllable scroll pause/continue.
- Scrolling behavior is not interrupted when applying background switching.
- Lightweight, at least one line of initialization code is required to create.
- Control gradient effect is softer and more natural.
- Fully comment and instructions.

# Using effect

<img src="https://github.com/shevakuilin/MyGithubPicture/raw/master/Pictures/SKAutoScrollLabelExample.gif" width="370" height ="665" />

# How to use

Step 1: Execute `git clone git@github.com:shevakuilin/SKAutoScrollLabel.git`，then view `Example`.


Step 2: Copy the `SKAutoScrollLabel` from the directory directly into your project, or add `pod 'SKAutoScrollLabel'` to the Podfile.

Step 3: Reference header file  `#import <SKAutoScrollLabel/SKAutoScrollLabel.h>`

# Installation

#### Created by code

```objectivec
// Scroll from right to left
SKAutoScrollLabel *scrollLabel = [[SKAutoScrollLabel alloc] initWithTextContent:@"Fly me to the moon.Let me play among the stars.Let me see what spring is like on Jupiter and Mars.In other words, hold my hand.In other words, baby, kiss me." direction: SK_AUTOSCROLL_DIRECTION_LEFT];
scrollLabel.backgroundColor = [UIColor orangeColor];
scrollLabel.textColor = [UIColor whiteColor];
// ... other settings
```

#### Created by storyboard

```objectivec
// Set the object's class to SKAutoScrollLabel in the storyboard
@property (weak, nonatomic) IBOutlet SKAutoScrollLabel *scrollLabel;

// Scroll from right to left
self.scrollLabel.textContent = @"Fly me to the moon.Let me play among the stars.Let me see what spring is like on Jupiter and Mars.In other words, hold my hand.In other words, baby, kiss me.";
self.scrollLabel.direction = SK_AUTOSCROLL_DIRECTION_LEFT;
self.scrollLabel.backgroundColor = [UIColor orangeColor];
self.scrollLabel.textColor = [UIColor whiteColor];
// ... other settings
```

# Parameter meaning

- `direction` scrolling direction
	- SK_AUTOSCROLL_DIRECTION_RIGHT 	// Scroll from left to right
	- SK_AUTOSCROLL_DIRECTION_LEFT	// Scroll from right to left
	- SK_AUTOSCROLL_DIRECTION_TOP		// Scroll from bottom to top
	- SK_AUTOSCROLL_DIRECTION_BOTTOM	// Scroll from top to bottom


- `pointsPerFrame` The distance each frame moves.The default vaule is 1.0f.

- `labelSpacing` The spacing of each scrolling label.The default vaule is 20.

- `textContent` Plain text content.

- `attributedTextContent` Rich text content.

- `textColor` Plain text color.

- `font` Plain text font.

- `textAlignment` Plain text alignment. 

- `enableFade` Default YES. Enable gradients of lable boundaries to fade.

# Control Method

```objc
- (void)pauseScroll; // Pause scrolling animation being played.
```

```objc
- (void)continueScroll; // Make a paused scrolling animation continue playing.
```


------

# 简述


SKAutoScrollLabel是一个同时支持水平/垂直两种类型的“跑马灯”效果的自动滚动UILabel。在滚动的边缘使用了梯度褪色来解决滚动边缘生硬的效果问题，总体效果呈现出混然天成的感觉，并且使用简单方便。如果你觉得还不错，请star支持一下吧~

# 特性

- 支持上、下、左、右四个方向的自动滚动
- 随时可自由控制的滚动暂停 / 继续
- 应用前后台切换时，滚动行为不会被中断
- 轻量级，最少仅需一行初始化代码即可完成创建
- 控件梯度渐变效果柔和，更自然
- 完善的注释与说明


### 效果图 
<img src="https://github.com/shevakuilin/MyGithubPicture/raw/master/Pictures/SKAutoScrollLabelExample.gif" width="370" height ="665" />


# 如何开始

1.`git clone git@github.com:shevakuilin/SKAutoScrollLabel.git`，查看示例工程 Example

2.直接将目录下的 SKAutoScrollLabel 拷贝到你的工程中，或在Podfile文件中添加 ```pod 'SKAutoScrollLabel'```

3.引用头文件 `#import <SKAutoScrollLabel/SKAutoScrollLabel.h>`

# 初始化

#### 通过代码创建

```objectivec
// 创建一个从右向左滚动的，背景颜色为橙色，字体颜色为白色的滚动 Label
SKAutoScrollLabel *scrollLabel = [[SKAutoScrollLabel alloc] initWithTextContent:@"你指尖跃动的电光, 是我此生不灭的信仰! 唯我超电磁炮永世长存!! 哔哩哔哩(゜-゜)つロ干杯~-bilibili" direction: SK_AUTOSCROLL_DIRECTION_LEFT];
scrollLabel.backgroundColor = [UIColor orangeColor];
scrollLabel.textColor = [UIColor whiteColor];
// ... 其他设置
```

#### 通过 storyboard 创建

```objectivec
// 在 storyboard 中将对象的类设置为 SKAutoScrollLabel
@property (weak, nonatomic) IBOutlet SKAutoScrollLabel *scrollLabel;

// 创建一个从右向左滚动的，背景颜色为橙色，字体颜色为白色的滚动 Label
self.scrollLabel.textContent = @"你指尖跃动的电光, 是我此生不灭的信仰! 唯我超电磁炮永世长存!! 哔哩哔哩(゜-゜)つロ干杯~-bilibili";
self.scrollLabel.direction = SK_AUTOSCROLL_DIRECTION_LEFT;
self.scrollLabel.backgroundColor = [UIColor orangeColor];
self.scrollLabel.textColor = [UIColor whiteColor];
// ... 其他设置
```

# 基本参数

- `direction` 滚动方向
	- SK_AUTOSCROLL_DIRECTION_RIGHT 	// 从左向右滚动, 默认选项
	- SK_AUTOSCROLL_DIRECTION_LEFT	// 从右向左滚动
	- SK_AUTOSCROLL_DIRECTION_TOP		// 从下向上滚动
	- SK_AUTOSCROLL_DIRECTION_BOTTOM	// 从上向下滚动


- `pointsPerFrame` 每帧移动的距离。默认值为1.0f。

- `labelSpacing` 每个滚动标签的间距。默认值为20。

- `textContent` 普通文本内容

- `attributedTextContent` 富文本内容

- `textColor` 文本颜色

- `font` 字体

- `textAlignment` 文字对齐

- `enableFade` 开关梯度渐变，默认开启

# 控制方法

```objc
- (void)pauseScroll; // 暂停滚动
```

```objc
- (void)continueScroll; // 继续滚动
```

### 感谢你花时间阅读以上内容, 如果这个项目能够帮助到你，记得告诉我


Email: shevakuilin@gmail.com
