# TMIndicatorButton

[![CI Status](https://img.shields.io/travis/DragonBattlesun/TMIndicatorButton.svg?style=flat)](https://travis-ci.org/DragonBattlesun/TMIndicatorButton)
[![Version](https://img.shields.io/cocoapods/v/TMIndicatorButton.svg?style=flat)](https://cocoapods.org/pods/TMIndicatorButton)
[![License](https://img.shields.io/cocoapods/l/TMIndicatorButton.svg?style=flat)](https://cocoapods.org/pods/TMIndicatorButton)
[![Platform](https://img.shields.io/cocoapods/p/TMIndicatorButton.svg?style=flat)](https://cocoapods.org/pods/TMIndicatorButton)

TMIndicatorButton 是一个功能丰富的 iOS 按钮组件，支持多种加载动画效果。

## 特性

- 支持多种内置动画效果
- 支持自定义动画
- 支持按钮状态切换
- 使用简单，配置灵活

## 要求

- iOS 13.0+
- Swift 5.0+
- Xcode 12.0+

## 安装

TMIndicatorButton 可通过 [CocoaPods](https://cocoapods.org) 安装。只需在您的 Podfile 中添加以下行：

```ruby
pod 'TMIndicatorButton'
```

## 使用方法

```swift
import TMIndicatorButton

// 创建按钮
let button = TMIndicatorButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))

// 设置标题
button.setTitle("登录")

// 显示加载动画
button.showLoader()

// 隐藏加载动画
button.hideLoader()
```

## 自定义动画

您可以通过继承 `TMIndicator` 类来创建自定义动画：

```swift
class CustomIndicator: TMIndicator {
    override func setupAnimation() {
        // 实现您的自定义动画
    }
}
```

## 作者

DragonBattlesun, dragonbattlesun@gmail.com

## 许可证

TMIndicatorButton 基于 MIT 许可证开源。详见 LICENSE 文件。
