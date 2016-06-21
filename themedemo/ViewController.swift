//
//  ViewController.swift
//  themedemo
//
//  Created by 李修冶 on 16/6/16.
//  Copyright © 2016年 李修冶. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var themeTitle: UINavigationItem!

	@IBOutlet weak var themeView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		/**
		 ThemeManager单例添加需要进行主题切换的控件

		 - parameter needview:    需要添加的控价组 ［UIView］类型的数组
		 - parameter ifImageName: 如果有imageView 就在写上白天的图片名称
		 */
		ThemeManger.sharedSingleton.addNeedThemeViews([view, themeView], ifImageName: "image.jpg")
		/*
		 添加两组Imageview 需要这么写,后面的参数只对一个imageView有效
		 ThemeManger.sharedSingleton.addNeedThemeViews([view1,imageView1], ifImageName: "image1")

		 ThemeManger.sharedSingleton.addNeedThemeViews([view2, imageView2], ifImageName: "image2.jpg")
		 */
	}

}

