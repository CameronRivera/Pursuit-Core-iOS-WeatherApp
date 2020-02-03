//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let mainView = MainView()
    let stringVar = ""
    var weatherForecast: WeatherWrapper? {
        didSet{
            DispatchQueue.main.async{
                self.mainView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView(){
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Weekly Forecast"
        setUp()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainView.cityTextField.layer.borderWidth = 0.5
        mainView.cityTextField.layer.borderColor = UIColor.lightGray.cgColor
        mainView.cityTextField.layer.cornerRadius = 10.0
    }
    
    private func setUp(){
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: "weatherCell")
        mainView.cityTextField.delegate = self
        DarkSkyAPI.getWeather(DarkSkyAPI.getWeatherURL()) { [weak self] result in
            switch result{
            case .failure(let netError):
                DispatchQueue.main.async{
                    self?.showAlert("Loading Error", "Error Loading weather data: \(netError)")
                }
            case .success(let wrapper):
                self?.weatherForecast = wrapper
            }
        }
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherForecast?.daily.data.count ?? 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let xCell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
            fatalError("Could not dequeue collectionViewCell as WeatherCell.")
        }
        
        if let weather = weatherForecast {
            xCell.setUp(weather.daily.data[indexPath.row])
        }
        xCell.backgroundColor = .systemBackground
        return xCell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width * 0.8, height: collectionView.bounds.size.height * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedVC = DetailViewController()
        detailedVC.dailyForecast = weatherForecast?.daily.data[indexPath.row]
        navigationController?.pushViewController(detailedVC, animated: true)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return false
        }
        
        let allText = text + string
        
        if !DarkSkyAPI.areYouNumber(string) || allText.count > 5{
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        
        if text.count != 5 {
            return false
        }
        
        textField.resignFirstResponder()
        return true
    }
}

