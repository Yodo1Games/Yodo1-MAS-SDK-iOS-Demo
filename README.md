# Yodo1-MAS-SDK-iOS-Demo
我们假设你的设备已经安装`cocoapods`，如果未安装请参考`Cocoapods`[官方文档](https://www.cocoapods.org/)

- 使用`终端`执行以下命令
```ruby
cd Demo项目根目录
pod install
```

- 修改`Bundle Identifier`为你游戏的包名, 
- 修改`Info.plist`文件中`GADApplicationIdentifier`的值为你游戏的`AdMob Id`
- 修改`ViewController.m`中`Yodo1Mas`初始化的`AppId`为你游戏的`AppId`
```iOS
[[Yodo1Mas sharedInstance] initWithAppId:@"Your App Id" successful:^{
    
} fail:^(Yodo1MasError *error) {
    
}];
```

更详细的集成步骤，请参考[文档](https://github.com/Yodo1Games/MAS-Documents/blob/zh-cn/zh-cn/integration-ios.md)