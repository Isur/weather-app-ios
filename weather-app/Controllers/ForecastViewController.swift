//
//  ForecastViewController.swift
//  weather-app
//
//  Created by Artur on 24/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import Foundation
import UIKit

class ForecastViewController: UIViewController{
    let model = APICalls()
    
    
    @IBOutlet weak var someLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.someLabel.text = "tset"
    }
}
