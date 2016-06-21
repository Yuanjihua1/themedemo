//
//  File.swift
//  themedemo
//
//  Created by 李修冶 on 16/6/18.
//  Copyright © 2016年 李修冶. All rights reserved.
//

import UIKit

class ThemeManger: NSObject {
	private var allThemeViews: [UIView]? = Array()

	class var sharedSingleton: ThemeManger {
		struct Inner {
			static let instance: ThemeManger = ThemeManger()
		}
		return Inner.instance
	}

	private override init () {
		super.init()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(change), name: "changeTheme", object: nil)
	}

	func addNeedThemeViews(needview: [UIView], ifImageName: String?) {
		// 遍历数组
		for needView in needview {

			needView.normalBackgroundColor = needView.backgroundColor

			if let label = needView as? UILabel {
				label.normalTextColor = label.textColor
			}

			if let imageView = needView as? UIImageView {
				imageView.imagename = ifImageName
			}

			// 这才是真正的将view添加私有数组中，前面的还要做一些操作
			// 所以数组必须设为私有的
			allThemeViews?.append(needView)
			// 根据本地UserDefaults的状态，改变view的主题
			needView.changeToThemeFromUserDefaults()
		}
	}

	func removeNotificationCenter() {
		NSNotificationCenter.defaultCenter().removeObserver(self, name: "changeTheme", object: nil)
	}

	// 收到改变的主题的通知就会调用这个方法
	func change() {

		// 改变本地的NSUserDefaults主题状态
		if let bool: Bool = NSUserDefaults.standardUserDefaults().boolForKey("themeModel") {

			NSUserDefaults.standardUserDefaults().setBool(!bool, forKey: "themeModel")
			NSUserDefaults.standardUserDefaults().synchronize()
		}

		// 遍历数组，然后每个view都调用changeToThemeFromUserDefaults
		if allThemeViews?.count > 0 {
			for view in allThemeViews! {
				view.changeToThemeFromUserDefaults()
			}
		}

	}

	deinit {
		removeNotificationCenter()
	}

}