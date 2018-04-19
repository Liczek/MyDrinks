//
//  MainViewCell.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 18.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell {
	
	var drinkNameLabel: UILabel = {
		let nameLabel = UILabel()
		nameLabel.text = "No Name"
		nameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		nameLabel.backgroundColor = UIColor.clear
		nameLabel.textAlignment = .center
		return nameLabel
	}()
	
	var drinkBrandName: UILabel = {
		let brandLabel = UILabel()
		brandLabel.text = "No Name"
		brandLabel.font = UIFont.preferredFont(forTextStyle: .body)
		brandLabel.backgroundColor = UIColor.clear
		brandLabel.textAlignment = .center
		return brandLabel
	}()
	
	var drinkImageView: UIImageView = {
		let image = UIImageView()
		image.layer.masksToBounds = true
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCell()
		setConstraints()
		
		



	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

	
	func setupCell() {
		addSubview(drinkNameLabel)
		addSubview(drinkBrandName)
		addSubview(drinkImageView)
	}
	
	func setConstraints() {
		addConstraintsWithFormat("H:|[v0]|", views: drinkNameLabel)
		addConstraintsWithFormat("H:|[v0]|", views: drinkBrandName)
		addConstraintsWithFormat("H:|[v0]|", views: drinkImageView)
		addConstraintsWithFormat("V:|[v0]-2-[v1]-2-[v2]|", views: drinkNameLabel, drinkBrandName, drinkImageView)
	}

}

