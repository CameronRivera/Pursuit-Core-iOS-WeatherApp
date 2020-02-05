//
//  FavouritesViewController.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {

    private var favouriteView = FavouritesView()
    private var fileManagerHandler = FileManagerHelper<StoragePhoto>("Favourites.plist")
    private var favourites = [StoragePhoto](){
        didSet {
            DispatchQueue.main.async{
                self.favouriteView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView(){
        view = favouriteView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Favourites"
        favouriteView.collectionView.register(FavouriteCell.self, forCellWithReuseIdentifier: "favouriteCell")
        favouriteView.collectionView.dataSource = self
        favouriteView.collectionView.delegate = self

    }
    
    private func setUp(){
        do {
            favourites = try fileManagerHandler.getObject()
        } catch {
            showAlert("Error Loading Favourites", "\(error)")
        }
    }
}

extension FavouritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let xCell = collectionView.dequeueReusableCell(withReuseIdentifier: "favouriteCell", for: indexPath) as? FavouriteCell else {
            fatalError("Could not create an instance of FavouriteCell")
        }
        xCell.backgroundColor = .systemGreen
        xCell.setUp(favourites[indexPath.row])
        return xCell
    }
}

extension FavouritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
    }
}
