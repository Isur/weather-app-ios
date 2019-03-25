//
//  ForecastTableVC.swift
//  weather-app
//
//  Created by Artur on 26/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import UIKit

class ForecastTableVC: UITableViewController {
    var forecast : WeatherForecast?
    var model : APICalls?
    override func viewDidLoad() {
        super.viewDidLoad()
        getForecast()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func getForecast(){
        model?.getWeatherForecast(completionHandler: { (forecast, err) in
            if let forecast = forecast{
                self.forecast = forecast
                print(self.forecast)
                print(self.forecast?.list.count)
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forecast?.list.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        var cellString = String(format: "%.2f",self.forecast!.list[indexPath.row].main.temp) + "°C"
        cellString += " " + self.forecast!.list[indexPath.row].weather[0].description
        cellString += " -- Wind " + String(format: "%.2f", self.forecast!.list[indexPath.row].wind.speed) + " m/s"
        cell.detailTextLabel?.text = self.forecast?.list[indexPath.row].dt_txt
        cell.textLabel?.text = cellString
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.forecast?.city.name
    }
}
