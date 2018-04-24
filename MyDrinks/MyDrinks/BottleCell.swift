//
//  TableCell.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 23.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class BottleCell: UITableViewCell {

	var drinkNameLabel: UILabel = {
		let nameLabel = UILabel()
		nameLabel.text = "No Name"
		nameLabel.textColor = UIColor.textColor
		nameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		nameLabel.backgroundColor = UIColor.clear
		nameLabel.textAlignment = .center
		nameLabel.adjustsFontSizeToFitWidth = true
		return nameLabel
	}()
	
	var drinkBrandName: UILabel = {
		let brandLabel = UILabel()
		brandLabel.text = "No Name"
		brandLabel.textColor = UIColor.textColor
		brandLabel.font = UIFont.preferredFont(forTextStyle: .body)
		brandLabel.backgroundColor = UIColor.clear
		brandLabel.textAlignment = .center
		brandLabel.adjustsFontSizeToFitWidth = true
		return brandLabel
	}()
	
	var drinkImageView: UIImageView = {
		let image = UIImageView()
		image.layer.masksToBounds = true
		image.contentMode = .scaleAspectFit
		return image
	}()
	
    override func awakeFromNib() {
        super.awakeFromNib()
     	backgroundColor = UIColor.backgroundColor
		setupCell()
		setCellConstraints()
		drinkNameLabel.text = "Yum Yum Yum Yum Yum Yum Yum Yum"
		drinkBrandName.text = "DeerBeer"
		drinkImageView.image = UIImage(named: "yamyam")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setupCell() {
		addSubview(drinkNameLabel)
		addSubview(drinkBrandName)
		addSubview(drinkImageView)
		selectionStyle = .none
	}
	
	func setCellConstraints() {
		addConstraintsWithFormat("H:|-4-[v0]-4-|", views: drinkNameLabel)
		addConstraintsWithFormat("H:|-4-[v0]-4-|", views: drinkBrandName)
		addConstraintsWithFormat("H:|[v0]|", views: drinkImageView)
		addConstraintsWithFormat("V:|[v0]-2-[v1]-2-[v2]|", views: drinkNameLabel, drinkBrandName, drinkImageView)
	}

}
