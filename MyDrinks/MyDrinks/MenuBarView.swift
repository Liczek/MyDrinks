//
//  MenuBarView.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 19.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class MenuBarView: UIView {
	
	let filtersButton: UIButton = {
		let button = UIButton()
		let origImage = UIImage(named: "filters")
		button.tintColor = UIColor.borderLineAndTintColor
		let tintedImage = origImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
		button.setImage(tintedImage, for: UIControlState.normal)
		button.contentMode = .center
		button.imageView?.contentMode = .scaleToFill
		button.backgroundColor = UIColor.clear
		return button
	}()
	
	
	let searchButton: UIButton = {
		let button = UIButton()
		let origImage = UIImage(named: "search_square")
		button.tintColor = UIColor.borderLineAndTintColor
		let tintedImage = origImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
		button.setImage(tintedImage, for: UIControlState.normal)
		button.contentMode = .center
		button.imageView?.contentMode = .scaleToFill
		button.backgroundColor = UIColor.clear
		return button
	}()
	
	let searchTextField: UITextField = {
		let textfield = UITextField()
		textfield.textColor = UIColor.borderLineAndTintColor
		textfield.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedStringKey.foregroundColor: UIColor.borderLineAndTintColor])
		textfield.backgroundColor = UIColor.backgroundColor.withAlphaComponent(0.3)
		textfield.autocapitalizationType = .none
		textfield.autocorrectionType = .no
//		textfield.borderStyle = .roundedRect
//		textfield.placeholder = "Search"
		textfield.textAlignment = .center
		textfield.font = UIFont.preferredFont(forTextStyle: .title2)
		textfield.clearButtonMode = .whileEditing
		textfield.layer.cornerRadius = 5
		textfield.layer.borderWidth = 0.5
		textfield.layer.borderColor = UIColor.borderLineAndTintColor.cgColor
		textfield.clipsToBounds = true
		return textfield
	}()
	
	let dividendLine: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.borderLineAndTintColor
		return view
	}()
	
	var mainViewController: MainViewController?
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.backgroundColor
		addSubview(filtersButton)
		addSubview(searchButton)
		addSubview(searchTextField)
		addSubview(dividendLine)
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupConstraints() {
		addConstraintsWithFormat("H:|-5-[v0(44)]-5-[v1]-5-[v2(44)]-5-|", views: filtersButton, searchTextField ,searchButton)
		addConstraintsWithFormat("V:|-5-[v0(44)]-5-|", views: filtersButton)
		addConstraintsWithFormat("V:|-8-[v0]-8-|", views: searchTextField)
		addConstraintsWithFormat("V:|-5-[v0(44)]-5-|", views: searchButton)
		
//		addConstraintsWithFormat("H:|[v0]|", views: dividendLine)
//		addConstraintsWithFormat("V:[v0(1)]|", views: dividendLine)
	}
	
	
	
	
	

}


