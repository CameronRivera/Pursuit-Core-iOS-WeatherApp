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
    
    override func loadView(){
        view = favouriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Favourites"
        setUp()
    }
    
    private func setUp(){
        favouriteView.collectionView.register(FavouriteCell.self, forCellWithReuseIdentifier: "favouriteCell")
        favouriteView.collectionView.dataSource = self
        favouriteView.collectionView.delegate = self
    }
}

extension FavouritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let xCell = collectionView.dequeueReusableCell(withReuseIdentifier: "favouriteCell", for: indexPath) as? FavouriteCell else {
            fatalError("Could not create an instance of FavouriteCell")
        }
        xCell.backgroundColor = .systemGreen
        return xCell
    }
}

extension FavouritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}
