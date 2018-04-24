//
//  MainViewCell.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 18.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
	
	let cellID = "cellID"
	
	
	lazy var beerTableView: UITableView = {
		let table = UITableView()
		table.delegate = self
		table.dataSource = self
		table.backgroundColor = UIColor.clear
		return table
	}()
	
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		beerTableView.register(TableCell.self, forCellReuseIdentifier: cellID)
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
	
		return beerTableView.frame.height - 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = beerTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableCell
			cell.awakeFromNib()
			return cell
		} else if indexPath.row == 1 {
			let cell = beerTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableCell
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

