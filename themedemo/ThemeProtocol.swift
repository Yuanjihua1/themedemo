//
//  ThemeProtocol.swift
//  themedemo
//
//  Created by 李修冶 on 16/6/16.
//  Copyright © 2016年 李修冶. All rights reserved.
//

import UIKit

@objc protocol ThemeProtocol {
	var isRegistering: Bool { get set }

	optional func registerNotificationCenter()
	func removeNotificationCenter()

	func setNormalTheme(method: () -> Void) -> AnyObject
	optional var setnormalTheme: () -> Void { get set }
	optional var setNightTheme: () -> Void { get set }

	optional func changeToNormalTheme() -> Void
	optional func changeToNightTheme() -> Void
}

extension UIViewController: ThemeProtocol {
	var isRegistering: Bool {
		get {
			return false
		}
		set {

		}
	}
	func registerNotificationCenter() {

	}
	func removeNotificationCenter() {

	}

	var setnormalTheme: () -> Void {
		get {
			let block: () -> Void = {

			}
			return block
		}

		set {

		}
	}

	var setNightTheme: () -> Void {
		get {
			let block: () -> Void = {

			}
			return block
		}

		set {

		}
	}

	func setNormalTheme(method: () -> Void) -> AnyObject {

		method()
		print("成功设置成为默认主题")
		return self
	}

}