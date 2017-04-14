# 简述


SKAutoScrollLabel是一个同时支持水平/垂直两种类型的“跑马灯”效果的自动滚动UILabel。在滚动的边缘使用了梯度褪色来解决滚动边缘生硬的效果问题，总体效果呈现出忽然天成的感觉，并且使用简单方便。如果你觉得还不错，请star支持一下吧~

### 效果图 
<img src="http://ofg0p74ar.bkt.clouddn.com/%E8%B7%91%E9%A9%AC%E7%81%AF.gif" width="370" height ="665" />


# 如何开始

1.从GitHub上Clone-->SKAutoScrollLabel，然后查看Demo

2.直接将目录下的SKAutoScrollLabel拷贝到工程中，或在podfile文件夹中添加 ```pod 'SKAutoScrollLabel'```


# 使用方法

#### 初始化


```objectivec
SKAutoScrollLabel * leftLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 50, [UIScreen mainScreen].bounds.size.width - 100, 50)];
[self.view addSubview:leftLabel];
```

#### 基本设置

```objectivec
leftLabel.backgroundColor = [UIColor blackColor];// 背景色
leftLabel.textColor = [UIColor whiteColor];// 字体颜色
leftLabel.font = [UIFont systemFontOfSize:16];// 字体大小
leftLabel.direction = SK_AUTOSCROLL_DIRECTION_LEFT;// 滚动方向，这是向左滚动
leftLabel.text = text;// 显示内容
```

### 感谢你花时间阅读以上内容, 如果这个项目能够帮助到你，记得告诉我


Email: shevakuilin@gmail.com
