//
//  WeatherTabBarController.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherTabBarController: UITabBarController {

    public lazy var mainViewController: MainViewController = {
        let viewController = MainViewController()
        viewController.tabBarItem = UITabBarItem(title: "7 Day Forecast", image: UIImage(systemName: "cloud"), tag: 0)
        return viewController
    }()
    
    public lazy var favouritesViewController: FavouritesViewController = {
        let viewController = FavouritesViewController()
        viewController.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "star"), tag: 1)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [UINavigationController(rootViewController: mainViewController),UINavigationController(rootViewController:favouritesViewController)]
    }

}
