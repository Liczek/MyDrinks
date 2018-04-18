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
	let cellColors = [UIColor.green, UIColor.red, UIColor.orange, UIColor.yellow]
	var database = [Beer]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		configureDatabase()
		
		title = "MyDrinks"
		collectionView?.backgroundColor = UIColor.white
		collectionView?.register(MainViewCell.self, forCellWithReuseIdentifier: cellID)
		setupCollectionView()
		
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return database.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MainViewCell
		cell.backgroundColor = cellColors[indexPath.item]
		let drink = database[indexPath.item]
		cell.drinkNameLabel.text = drink.name
		cell.drinkBrandName.text = drink.brandName
		if let imageName = drink.imageName {
			cell.drinkImageView.image = UIImage(named: imageName)
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 100)
	}
	
	func setupCollectionView() {
		
		collectionView?.alwaysBounceHorizontal = true
		collectionView?.isPagingEnabled = true
		
		if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
			flowLayout.scrollDirection = .horizontal
			flowLayout.minimumLineSpacing = 0
		
		}
	}
	func setConstraints() {

		
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



