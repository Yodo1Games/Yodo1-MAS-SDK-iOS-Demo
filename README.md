# Yodo1-MAS-SDK-iOS-Demo

## Overview

MAS is Yodo1's in-app monetization solution.

Please check out our [documentation](https://support.yodo1.com/hc/en-us/articles/360060558854) to get started on integrating.

## Demo App

To get started with the demo app, follow the instructions below:

1. If you already have CocoaPods(1.8.0 and above) installed, please ignore it. Otherwise, to install CocoaPods, use the following command to install CocoaPods.

	```
	/bin/bash -c "$(curl -fsSL https://gist.githubusercontent.com/nicky9112/0bf903795f77c5052ff12c92e629f975/raw/a8783d03c96b8d1d50f92977bfa0112711fbc57a/install-cocoapods.sh)"
	```

2. Execute the following commands at Terminal.

	```ruby
	cd "DemoPath"
	pod install
	```

3. Change `Bundle Identifier` to your game's `Bundle Identifier`
4. Change the value of `GADApplicationIdentifier` in the `Info.plist` file to your game‘s AdMob App ID(Obtain from MAS dashboard).
5. Change the `Your AppKey` value in `ViewController.m` file with the AppId from your MAS dashboard.

	```iOS
	[[Yodo1Mas sharedInstance] initWithAppId:@"Your AppKey" successful:^{
	    
	} fail:^(Yodo1MasError *error) {
	    
	}];
	```

## Support
For feature requests, improvements, questions or any other integration issues using MAS Mediation by Yodo1, please contact us via our support page: https://developers.yodo1.com/contact-us/.