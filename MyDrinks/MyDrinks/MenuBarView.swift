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
		button.setImage(UIImage(named: "filters"), for: UIControlState.normal)
//		button.frame.size = CGSize(width: 15, height: 15)
		button.contentMode = .center
		button.imageView?.contentMode = .scaleToFill
		button.backgroundColor = UIColor.red
		return button
	}()
	
	var mainViewController: MainViewController?
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.black.withAlphaComponent(0.6)
		addSubview(filtersButton)
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupConstraints() {
		addConstraintsWithFormat("H:|-50-[v0(46)]", views: filtersButton)
		addConstraintsWithFormat("V:|-7-[v0(46)]-7-|", views: filtersButton)
		
	}
	
	
	
	
	

}
