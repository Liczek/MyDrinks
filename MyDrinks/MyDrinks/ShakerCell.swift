//
//  shakerCell.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 24.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ShakerCell: UICollectionViewCell {
	
	let bottleImage: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "shaker")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
		imageView.tintColor = UIColor.borderLineAndTintColor
		imageView.image = image
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews() {
		backgroundColor = UIColor.backgroundColor
		addSubview(bottleImage)
		addConstraintsWithFormat("H:|[v0(44)]|", views: bottleImage)
		addConstraint(NSLayoutConstraint(item: bottleImage, attribute: centerYAnchor, relatedBy: <#T##NSLayoutRelation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutAttribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>))
	}
}
