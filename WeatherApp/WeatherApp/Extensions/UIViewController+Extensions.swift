//
//  UIViewController+Extensions.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

extension UIViewController{
    // Shows an alert
    func showAlert(_ title: String, _ message: String, completion: ((UIAlertAction) -> ())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: completion)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
