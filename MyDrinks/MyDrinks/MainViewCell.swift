//
//  MainViewCell.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 18.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
	
	let bottleCellId = "bottleID"
	let ratingCellId = "ratingID"
	
	
	lazy var beerTableView: UITableView = {
		let table = UITableView()
		table.delegate = self
		table.dataSource = self
		table.backgroundColor = UIColor.clear
		table.separatorInset = UIEdgeInsetsMake(0, 16, 0, 16)
		table.separatorColor = UIColor.borderLineAndTintColor
		return table
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		beerTableView.register(BottleCell.self, forCellReuseIdentifier: bottleCellId)
		beerTableView.register(RatingCell.self, forCellReuseIdentifier: ratingCellId)
		setupCell()
		setConstraints()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - TableView
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return beerTableView.frame.height - 30
		} else if indexPath.row == 1 {
			return beerTableView.frame.height / 5
		} else {
			return 0
		}
	
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = beerTableView.dequeueReusableCell(withIdentifier: bottleCellId, for: indexPath) as! BottleCell
			cell.awakeFromNib()
			return cell
		} else if indexPath.row == 1 {
			let cell = beerTableView.dequeueReusableCell(withIdentifier: ratingCellId, for: indexPath) as! RatingCell
			cell.awakeFromNib()
			return cell
		} else {
			return UITableViewCell()
		}
	}
	
	
	
	func setupCell() {
		addSubview(beerTableView)
	}
	
	func setConstraints() {
		addConstraintsWithFormat("H:|[v0]|", views: beerTableView)
		addConstraintsWithFormat("V:|[v0]|", views: beerTableView)
	}

}

