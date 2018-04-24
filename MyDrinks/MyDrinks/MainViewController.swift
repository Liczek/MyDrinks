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
	
	lazy var rightArrowButton: UIButton = {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width / 15, height: view.frame.height / 15))
		button.tintColor = UIColor.borderLineAndTintColor
		let originImage = UIImage(named: "arrow_next")
		let tintedImage = originImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
		button.setImage(tintedImage, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	
	lazy var leftArrowButton: UIButton = {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width / 15, height: view.frame.height / 15))
		button.tintColor = UIColor.borderLineAndTintColor
		let originImage = UIImage(named: "arrow_previous")
		let tintedImage = originImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
		button.setImage(tintedImage, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.isTranslucent = false
		
		configureDatabase()
		
		let titleLabel: UILabel = {
			let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
			label.text = "MyDrinks"
			label.textColor = UIColor.borderLineAndTintColor
			label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
			label.textAlignment = .center
			return label
		}()
		navigationItem.titleView = titleLabel
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
//		let table = cell.beerTableView
//		let index = IndexPath(row: 0, section: 0)
//		let tableCell = table.cellForRow(at: index) as! TableCell
//		let drink = database[indexPath.item]
//		tableCell.drinkNameLabel.text = drink.name
//		tableCell.drinkBrandName.text = drink.brandName
//		if let imageName = drink.imageName {
//			let drinkImage = UIImage(named: imageName)
//			tableCell.drinkImageView.image = drinkImage
//		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 54)
	}
	
	func setupViews() {
		
		view.addSubview(menuBarView)
		view.addSubview(rightArrowButton)
		view.addSubview(leftArrowButton)

		
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
		view.addConstraintsWithFormat("H:[v0]|", views: rightArrowButton)
		view.addConstraintsWithFormat("H:|[v0]", views: leftArrowButton)
		rightArrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		leftArrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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



