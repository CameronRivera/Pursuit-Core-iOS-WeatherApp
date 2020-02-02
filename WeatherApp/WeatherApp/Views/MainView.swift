//
//  MainView.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "The current weather is: "
        return label
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemTeal
        return collectionView
    }()
    
    public lazy var zipCodeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter a zipCode"
        return label
    }()
    
    public lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.placeholder = "Enter query text here"
        return textField
    }()
    
//    public lazy var customCell: WeatherCell =  {
//        let cell = WeatherCell(frame: CGRect.zero)
//        return cell
//    }()
//
//    public lazy var customCellDateLabel: UILabel = {
//       let label = UILabel()
//        label.textAlignment = .center
//        return label
//    }()
//    
//    public lazy var customCellImage: UIImageView = {
//        let imageView = UIImageView()
//        return imageView
//    }()
//    
//    public lazy var customCellHighLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        return label
//    }()
//    
//    public lazy var customCellLowLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        return label
//    }()
//    
//    public lazy var cellHighLowStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 0
//        stackView.distribution = .equalCentering
//        return stackView
//    }()
    
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
//        setUpCollectionView()
    }
    
    private func setUpCityLabelConstraints() {
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20), cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    private func setUpCollectionViewConstraints(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20), collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)])
    }
    
    private func setUpZipCodeLabelConstraints(){
        addSubview(zipCodeLabel)
        zipCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([zipCodeLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20), zipCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), zipCodeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    private func setUpCityTextFieldConstraints() {
        addSubview(cityTextField)
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cityTextField.topAnchor.constraint(equalTo: zipCodeLabel.bottomAnchor, constant: 20), cityTextField.centerXAnchor.constraint(equalTo: centerXAnchor), cityTextField.heightAnchor.constraint(equalToConstant: 40), cityTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)])
    }
    
//    private func setUpCollectionView() {
//        setUpCustomCellDateLabelConstraints()
//        setUpCustomCellImageConstraints()
//        setUpStackViewConstraints()
//    }
//    
//    private func setUpCustomCellDateLabelConstraints() {
//        customCell.addSubview(customCellDateLabel)
//        customCellDateLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([customCellDateLabel.topAnchor.constraint(equalTo: customCell.topAnchor, constant: 8), customCellDateLabel.leadingAnchor.constraint(equalTo: customCell.leadingAnchor, constant: 8), customCellDateLabel.trailingAnchor.constraint(equalTo: customCell.trailingAnchor, constant: -8)])
//    }
//    
//    private func setUpCustomCellImageConstraints() {
//        customCell.addSubview(customCellImage)
//        customCellImage.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([customCellImage.topAnchor.constraint(equalTo: customCellDateLabel.bottomAnchor, constant: 8), customCellImage.leadingAnchor.constraint(equalTo: customCell.leadingAnchor), customCellImage.trailingAnchor.constraint(equalTo: customCell.trailingAnchor), customCellImage.centerXAnchor.constraint(equalTo: customCell.centerXAnchor), customCellImage.heightAnchor.constraint(equalTo: customCell.heightAnchor, multiplier: 0.4)])
//    }
//    
//    private func setUpStackViewConstraints() {
//        customCell.addSubview(cellHighLowStackView)
//        cellHighLowStackView.translatesAutoresizingMaskIntoConstraints = false
//        cellHighLowStackView.addArrangedSubview(customCellHighLabel)
//        cellHighLowStackView.addArrangedSubview(customCellLowLabel)
//        
//        NSLayoutConstraint.activate([cellHighLowStackView.topAnchor.constraint(equalTo: customCellImage.bottomAnchor, constant: 8), cellHighLowStackView.leadingAnchor.constraint(equalTo: customCell.leadingAnchor, constant: 8), cellHighLowStackView.trailingAnchor.constraint(equalTo: customCell.trailingAnchor, constant: -8)])
//    }
    
    
}
