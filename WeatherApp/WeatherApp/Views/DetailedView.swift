//
//  DetailedView.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailedView: UIView {

    public lazy var cityAndForecastLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Filler Text"
        return label
    }()
    
    public lazy var cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Filler Text"
        return label
    }()
    
    public lazy var highLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Filler Text"
        return label
    }()
    
    public lazy var lowLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Filler Text"
        return label
    }()
    
    public lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Filler Text"
        return label
    }()
    
    public lazy var sunsetLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Filler Text"
        return label
    }()
    
    public lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Filler Text"
        return label
    }()
    
    public lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.text = "Filler Text"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var stackView: UIStackView = {
      let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0.0
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    public lazy var saveButton: UIBarButtonItem = {
       let barButton = UIBarButtonItem()
        barButton.title = ""
        barButton.image = UIImage(systemName: "heart")
        return barButton
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
        setUpCityAndForecastLabelConstraints()
        setUpCityImageViewConstraints()
        setUpDescriptionLabelConstraints()
        setUpStackViewConstraints()
    }
    
    private func setUpCityAndForecastLabelConstraints(){
        addSubview(cityAndForecastLabel)
        cityAndForecastLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cityAndForecastLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20), cityAndForecastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), cityAndForecastLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)])
    }
    
    private func setUpCityImageViewConstraints() {
        addSubview(cityImageView)
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cityImageView.topAnchor.constraint(equalTo: cityAndForecastLabel.bottomAnchor, constant: 20), cityImageView.leadingAnchor.constraint(equalTo: leadingAnchor), cityImageView.trailingAnchor.constraint(equalTo: trailingAnchor), cityImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45)])
    }
    
    private func setUpDescriptionLabelConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([descriptionLabel.topAnchor.constraint(equalTo: cityImageView.bottomAnchor, constant: 20), descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    private func setUpStackViewConstraints() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(highLabel)
        stackView.addArrangedSubview(lowLabel)
        stackView.addArrangedSubview(sunriseLabel)
        stackView.addArrangedSubview(sunsetLabel)
        stackView.addArrangedSubview(windSpeedLabel)
        stackView.addArrangedSubview(precipitationLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20), stackView.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
}
