//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    public lazy var customCellDateLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "This is some filler text"
        return label
    }()
    
    public lazy var customCellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    public lazy var customCellHighLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "High: "
        return label
    }()
    
    public lazy var customCellLowLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Low: "
        return label
    }()
    
    public lazy var cellHighLowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        setUpCustomCellDateLabelConstraints()
        setUpCustomCellImageConstraints()
        setUpStackViewConstraints()
    }
    
    private func setUpCustomCellDateLabelConstraints() {
        contentView.addSubview(customCellDateLabel)
        customCellDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([customCellDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8), customCellDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8), customCellDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)])
    }
    
    private func setUpCustomCellImageConstraints() {
        contentView.addSubview(customCellImage)
        customCellImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([customCellImage.topAnchor.constraint(equalTo: customCellDateLabel.bottomAnchor, constant: 8), customCellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), customCellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), customCellImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), customCellImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6)])
    }
    
    private func setUpStackViewConstraints() {
        contentView.addSubview(cellHighLowStackView)
        cellHighLowStackView.translatesAutoresizingMaskIntoConstraints = false
        cellHighLowStackView.addArrangedSubview(customCellHighLabel)
        cellHighLowStackView.addArrangedSubview(customCellLowLabel)
        
        NSLayoutConstraint.activate([cellHighLowStackView.topAnchor.constraint(equalTo: customCellImage.bottomAnchor, constant: 8), cellHighLowStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8), cellHighLowStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)])
    }
}
