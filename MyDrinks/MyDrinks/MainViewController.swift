//
//  ViewController.swift
//  MyDrinks
//
//  Created by Paweł Liczmański on 18.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	let cellID = "cellID"
	var database = [Beer]()
	let menuBarHeight:CGFloat = 54
	
	lazy var menuBarView: MenuBarView = {
		let mb = MenuBarView()
		mb.mainViewController = self
		return mb
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.isTranslucent = false
		
		configureDatabase()
		
		title = "MyDrinks"
		collectionView?.backgroundColor = UIColor.white
		collectionView?.register(MainViewCell.self, forCellWithReuseIdentifier: cellID)
		setupViews()
		setConstraints()
	
		
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return database.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MainViewCell
		cell.backgroundColor = UIColor.backgroundColor
		let drink = database[indexPath.item]
		cell.drinkNameLabel.text = drink.name
		cell.drinkBrandName.text = drink.brandName
		if let imageName = drink.imageName {
			cell.drinkImageView.image = UIImage(named: imageName)
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 54)
	}
	
	func setupViews() {
		
		view.addSubview(menuBarView)

		
		collectionView?.alwaysBounceHorizontal = true
		collectionView?.isPagingEnabled = true
		
		if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
			flowLayout.scrollDirection = .horizontal
			flowLayout.minimumLineSpacing = 0
		}
		collectionView?.contentInset = UIEdgeInsetsMake(menuBarHeight, 0, 0, 0)
		collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(menuBarHeight, 0, 0, 0)
	}
	func setConstraints() {
		let menuBarHeightInt: Int = Int(menuBarHeight)
		view.addConstraintsWithFormat("H:|[v0]|", views: menuBarView)
		view.addConstraintsWithFormat("V:|[v0(\(menuBarHeightInt))]", views: menuBarView)
		
	}
	
	func configureDatabase() {
		
		let beer1: Beer = {
			let beer = Beer()
			beer.name = "YamYam"
			beer.brandName = "Browar Deer Bear"
			beer.imageName = "yamyam"
			return beer
		}()
		
		let beer2: Beer = {
			let beer = Beer()
			beer.name = "YamYam Ramen"
			beer.brandName = "Browar Deer Bear"
			beer.imageName = "ramen"
			return beer
		}()
		
		let beer3: Beer = {
			let beer = Beer()
			beer.name = "Sofa King"
			beer.brandName = "Browar Deer Bear"
			beer.imageName = "sofaking"
			return beer
		}()
		
		let beer4: Beer = {
			let beer = Beer()
			beer.name = "Tropi Hoppi"
			beer.brandName = "Browar Deer Bear"
			beer.imageName = "tropihoppi"
			return beer
		}()
			database = [beer1, beer2, beer3, beer4]
	}


	
}



