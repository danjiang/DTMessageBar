# DTMessageBar

[![Swift](https://img.shields.io/badge/Swift-3.0-ff3f26.svg?style=flat)](https://swift.org/)
[![Platform](https://img.shields.io/cocoapods/p/DTMessageBar.svg?style=flat)](http://cocoadocs.org/docsets/DTMessageBar)
[![CocoaPods](http://img.shields.io/cocoapods/v/DTMessageBar.svg)](https://cocoapods.org/pods/DTMessageBar)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Introduction

Simple message bar.

![Demo](Demo.gif)

Standard Style.

![Success Standard](success_standard.jpg)

![Info Standard](info_standard.jpg)

![Warning Standard](warning_standard.jpg)

![Error Standard](error_standard.jpg)

Emoji Style.

![Success Emoji](success_emoji.jpg)

![Info Emoji](info_emoji.jpg)

![Warning Emoji](warning_emoji.jpg)

![Error Emoji](error_emoji.jpg)

## Installation

### Requirement

iOS 8.4+

### [CocoaPods](http://cocoapods.org)

To install DTMessageBar add a dependency to your Podfile:

```
pod "DTMessageBar"
```

### [Carthage](https://github.com/Carthage/Carthage)

To install DTMessageBar add a dependency to your Cartfile:

```
github "danjiang/DTMessageBar"
```

```
carthage update --platform ios
```

## Usage

### Import

```swift
import DTMessageBar
```

### Use

```swift
DTMessageBar.error(message: "Good Jobs") // Top is default position
DTMessageBar.success(message: "Good Jobs", position: .top)
DTMessageBar.info(message: "Good Jobs", position: .center)
DTMessageBar.warning(message: "Good Jobs", position: .bottom)
```

### Customize

```swift
DTMessageBar.style = .standard // Standard is default style
DTMessageBar.style = .emoji
```

