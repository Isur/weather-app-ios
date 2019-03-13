//
//  ViewController.swift
//  weather-app
//
//  Created by RMS2018 on 06/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import UIKit
import os;
class ViewController: UIViewController {
    let model = APICalls()
    @IBOutlet weak var CityLabel: UITextField!
    @IBAction func actionSubmit(_ sender: Any) {
        let city = CityLabel.text!
        model.getWeather(city: city)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

