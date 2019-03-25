//
//  ForecastViewController.swift
//  weather-app
//
//  Created by Artur on 24/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import Foundation
import UIKit

class ForecastViewController: UITableViewController{
    var model = APICalls()


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
}
