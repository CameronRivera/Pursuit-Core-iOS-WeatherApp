//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private var detailedView = DetailedView()
    
    override func loadView() {
        view = detailedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Detailed Forecast"
        setUp()
    }
    
    private func setUp() {
        navigationItem.rightBarButtonItem = detailedView.saveButton
    }
}
