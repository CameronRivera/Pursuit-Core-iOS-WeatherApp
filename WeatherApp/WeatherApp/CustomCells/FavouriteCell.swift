//
//  FavouriteCell.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavouriteCell: UICollectionViewCell {
    
    // An image View for the favourites picture
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpCollectionViewCellConstraints()
    }
    
    // Sets up constraints for the image view
    private func setUpCollectionViewCellConstraints(){
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: contentView.topAnchor), imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    // Sets an image in the image view.
    public func setUp(_ photo: StoragePhoto){
        imageView.image = UIImage(data: photo.photoData)
    }
}
