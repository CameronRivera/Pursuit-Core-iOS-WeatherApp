//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    private let stringVar = ""
    
    // Label for displaying the date
    public lazy var customCellDateLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "This is some filler text"
        return label
    }()
    
    // Image View for displaying weather image
    public lazy var customCellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    // label for displaying the daily high temperature
    public lazy var customCellHighLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "High: "
        return label
    }()
    
    // label for displaying the daily low temperature
    public lazy var customCellLowLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Low: "
        return label
    }()
    
    // Stack view for easier positioning of high and low label
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
    
    // Sets up a collection view with data
    public func setUp(_ forecast: Weather){
        customCellDateLabel.text = stringVar.intervalIntoDate(forecast.time)
        customCellLowLabel.text = "Daily Low: \(String(format: "%0.0f", forecast.temperatureLow)) °F"
        customCellHighLabel.text = "Daily High: \(String(format: "%0.0f", forecast.temperatureHigh)) °F"
        if let image = UIImage(named: forecast.icon) {
            customCellImage.image = image
        } else {
            customCellImage.image = UIImage(systemName: "tornado")
        }
    }
    
    // Shared initializer
    private func setUpCollectionView() {
        setUpCustomCellDateLabelConstraints()
        setUpCustomCellImageConstraints()
        setUpStackViewConstraints()
    }
    
    // Sets up Date Label Constraints
    private func setUpCustomCellDateLabelConstraints() {
        contentView.addSubview(customCellDateLabel)
        customCellDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([customCellDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8), customCellDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8), customCellDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)])
    }
    
    // Sets up Image View Constraints
    private func setUpCustomCellImageConstraints() {
        contentView.addSubview(customCellImage)
        customCellImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([customCellImage.topAnchor.constraint(equalTo: customCellDateLabel.bottomAnchor, constant: 8), customCellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), customCellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), customCellImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), customCellImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)])
    }
    
    // Sets up stackView constraints
    private func setUpStackViewConstraints() {
        contentView.addSubview(cellHighLowStackView)
        cellHighLowStackView.translatesAutoresizingMaskIntoConstraints = false
        cellHighLowStackView.addArrangedSubview(customCellHighLabel)
        cellHighLowStackView.addArrangedSubview(customCellLowLabel)
        
        NSLayoutConstraint.activate([cellHighLowStackView.topAnchor.constraint(equalTo: customCellImage.bottomAnchor, constant: 8), cellHighLowStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8), cellHighLowStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)])
    }
    
}
