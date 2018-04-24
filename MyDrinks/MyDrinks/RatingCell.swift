//
//  RatingCell.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 24.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class RatingCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	var rating = 0
	let cellIdentifier = "cellID"
	
	let ratingLabel: UILabel = {
		let label = UILabel()
		label.text = ""
		label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
		label.textColor = UIColor.textColor
		return label
	}()
	
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collection.alwaysBounceHorizontal = false
		layout.scrollDirection = .horizontal
		collection.delegate = self
		collection.dataSource = self
		return collection
	}()
	
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		backgroundColor = UIColor.backgroundColor
		
		setupViews()
		addConstraints()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 44, height: frame.height - 30)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ShakerCell
		cell.setupViews()
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 1
	}
	
	func setupViews() {
		addSubview(ratingLabel)
		addSubview(collectionView)
		ratingLabel.text = "Rating: \(String(rating))/10"
		collectionView.register(ShakerCell.self, forCellWithReuseIdentifier: cellIdentifier)
		
	}
	
	func addConstraints() {
		addConstraintsWithFormat("H:|-16-[v0]", views: ratingLabel)
		addConstraintsWithFormat("V:|[v0]-4-[v1]|", views: ratingLabel, collectionView)
		addConstraintsWithFormat("H:|[v0]|", views: collectionView)
	}
}
