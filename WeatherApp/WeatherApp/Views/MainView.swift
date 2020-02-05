//
//  MainView.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    // Label to display the city
    public lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "The current weather is: "
        return label
    }()
    
    // Collection View to display the weekly forecast
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemTeal
        return collectionView
    }()
    
    // Label to display instructions to the user.
    public lazy var zipCodeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter a zipCode"
        return label
    }()
    
    // TextField to allow the user to type in the textfield.
    public lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.placeholder = "Enter query text here"
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpCityLabelConstraints()
        setUpCollectionViewConstraints()
        setUpZipCodeLabelConstraints()
        setUpCityTextFieldConstraints()
    }
    
    // Constraints for the cityLabel
    private func setUpCityLabelConstraints() {
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20), cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    // Constraints for the collection view
    private func setUpCollectionViewConstraints(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20), collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)])
    }
    
    // Zip code label constraints
    private func setUpZipCodeLabelConstraints(){
        addSubview(zipCodeLabel)
        zipCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([zipCodeLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20), zipCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), zipCodeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    // TextField Constraints
    private func setUpCityTextFieldConstraints() {
        addSubview(cityTextField)
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cityTextField.topAnchor.constraint(equalTo: zipCodeLabel.bottomAnchor, constant: 20), cityTextField.centerXAnchor.constraint(equalTo: centerXAnchor), cityTextField.heightAnchor.constraint(equalToConstant: 40), cityTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)])
    }
    
}
