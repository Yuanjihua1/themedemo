
import UIKit

extension String {

	subscript (r: Range<Int>) -> String {

		get {
			let startIndex = self.startIndex.advancedBy(r.startIndex)
			let endIndex = self.startIndex.advancedBy(r.endIndex)
			return self[startIndex..<endIndex]
		}

	}

	var color: UIColor? {
		get {

			guard self.hasPrefix("#") else { return nil }

			var strRed = ""
			var strGreen = ""
			var strBlue = ""

			if String("\(self.endIndex)") == "4" {
				strRed = self[1...1] + self[1...1]
				strBlue = self[2...2] + self[2...2]
				strGreen = self[3...3] + self[3...3]
			} else if String("\(self.endIndex)") == "7" {
				strRed = self[1...2]
				strGreen = self[3...4]
				strBlue = self[5...6]
			}

			var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0;

			NSScanner(string: strRed).scanHexInt(&r)
			NSScanner(string: strGreen).scanHexInt(&g)
			NSScanner(string: strBlue).scanHexInt(&b)

			return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)

		}
	}
}