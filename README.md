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


# 使用方法

#### 初始化


```objectivec
SKAutoScrollLabel *scrollLabel = [[SKAutoScrollLabel alloc] initWithTextContent:@"你指尖跃动的电光, 是我此生不灭的信仰! 唯我超电磁炮永世长存!! 哔哩哔哩(゜-゜)つロ干杯~-bilibili" direction:self.scrollType];
```

#### 基本参数

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

#### 控制方法

```objc
- (void)pauseScroll; // 暂停滚动
```

```objc
- (void)continueScroll; // 继续滚动
```

### 感谢你花时间阅读以上内容, 如果这个项目能够帮助到你，记得告诉我


Email: shevakuilin@gmail.com
