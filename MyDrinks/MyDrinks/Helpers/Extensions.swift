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
