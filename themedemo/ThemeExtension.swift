//
//  ThemeExtension.swift
//  themedemo
//
//  Created by 李修冶 on 16/6/17.
//  Copyright © 2016年 李修冶. All rights reserved.
//

import UIKit

private struct NormalThemeColors {
	static let backgroundColor = "#fff".color
	static let textColor = "#000".color
}

private struct NightThemeColors {
	static let backgroundColor = "#333".color
	static let textColor = "#fff".color
}

private var rt_normalColor = ""
private var rt_nightColor = ""
extension UIView {

	/// 保存默认的背景颜色
	var normalBackgroundColor: UIColor? {
		get {
			return objc_getAssociatedObject(self, &rt_normalColor) as? UIColor
		}
		set {
			objc_setAssociatedObject(self, &rt_normalColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}

	/// 保存夜间的背景颜色
	var nightBackgroundColor: UIColor? {
		get {
			return objc_getAssociatedObject(self, &rt_nightColor) as? UIColor
		}
		set {
			objc_setAssociatedObject(self, &rt_nightColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}

	/**
	 变成默认主题
	 */
	func changeToNormalTheme() {
		if normalBackgroundColor != nil {
			self.backgroundColor = normalBackgroundColor
		} else {
			self.backgroundColor = NormalThemeColors.backgroundColor
		}
	}

	/**
	 变成夜间主题
	 */
	func changeToNightTheme() {
		if self.nightBackgroundColor != nil {
			self.backgroundColor = self.nightBackgroundColor
		} else {
			self.backgroundColor = NightThemeColors.backgroundColor
		}
	}

	/**
	 从本地的UserDefaults获取主题状态
	 */
	func changeToThemeFromUserDefaults() {

		let str = NSUserDefaults.standardUserDefaults().objectForKey("themeModel")
		if str === false {
			changeToNormalTheme()
		}

		if str === true {
			changeToNightTheme()
		}
	}

}

private var rt_normaltextcolor = ""
private var rt_nighttextcolor = ""
extension UILabel {

	var normalTextColor: UIColor? {
		get {
			return objc_getAssociatedObject(self, &rt_normaltextcolor) as? UIColor
		}
		set {
			objc_setAssociatedObject(self, &rt_normaltextcolor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}

	var nightTextColor: UIColor? {
		get {
			return objc_getAssociatedObject(self, &rt_nighttextcolor) as? UIColor
		}
		set {
			objc_setAssociatedObject(self, &rt_nighttextcolor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}

	override func changeToNormalTheme() {
		super.changeToNormalTheme()
		if normalTextColor != nil {
			self.textColor = normalTextColor
		} else {
			self.textColor = NormalThemeColors.textColor
		}

	}

	override func changeToNightTheme() {
		super.changeToNightTheme()
		if nightTextColor != nil {
			self.textColor = nightTextColor
		} else {
			self.textColor = NightThemeColors.textColor
		}
	}
}

private var rt_imagename = ""
extension UIImageView {

	var imagename: String? {
		get {
			return objc_getAssociatedObject(self, &rt_imagename) as? String
		}
		set {
			objc_setAssociatedObject(self, &rt_imagename, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}

	override func changeToNormalTheme() {
		super.changeToNormalTheme()
		guard imagename != nil else { return }
		self.image = UIImage(named: imagename!)
	}

	override func changeToNightTheme() {
		super.changeToNightTheme()

		guard imagename != nil else { return }

		if imagename!.hasSuffix("jpg") {
			let index = imagename!.endIndex.advancedBy(-4)
			let str = imagename!.substringToIndex(index)
			self.image = UIImage(named: str + "_night" + ".jpg")
		} else {
			self.image = UIImage(named: imagename! + "_night")
		}
	}

}