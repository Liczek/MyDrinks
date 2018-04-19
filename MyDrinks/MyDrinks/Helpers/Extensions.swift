//
//  Extensions.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 19.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

extension UIView {
	func addConstraintsWithFormat(_ format: String, views: UIView...) {
		var viewsDictionary = [String: UIView]()
		for (index, view) in views.enumerated() {
			view.translatesAutoresizingMaskIntoConstraints = false
			let key = "v\(index)"
			viewsDictionary[key] = view
		}
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
	}
}

extension UIColor {
	class var backgroundColor: UIColor {
		return UIColor(red: 239/255, green: 255/255, blue: 243/255, alpha: 1)
	}
	class var borderLineAndTintColor: UIColor {
		return UIColor(red: 217/255, green: 48/255, blue: 63/255, alpha: 1)
	}
	class var textColor: UIColor {
		return UIColor(red: 205/255, green: 13/255, blue: 55/255, alpha: 1)
	}
}
