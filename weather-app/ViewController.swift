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
    @IBAction func actionSubmit(_ sender: Any) {
        os_log("test action button submit");
        model.getWeather()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

