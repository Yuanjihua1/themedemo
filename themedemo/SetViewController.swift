//
//  SetViewController.swift
//  themedemo
//
//  Created by 李修冶 on 16/6/16.
//  Copyright © 2016年 李修冶. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

	@IBOutlet weak var day: UILabel!

	@IBOutlet weak var night: UILabel!

	@IBOutlet weak var sender: UISwitch!
	override func viewDidLoad() {
		super.viewDidLoad()
		sender.on = !NSUserDefaults.standardUserDefaults().boolForKey("themeModel")

		ThemeManger.sharedSingleton.addNeedThemeViews([day, night, view], ifImageName: nil)
	}

	@IBAction func sliderAction(sender: UISwitch) {
		let noti = NSNotification(name: "changeTheme", object: nil)
		NSNotificationCenter.defaultCenter().postNotification(noti)
	}
}
