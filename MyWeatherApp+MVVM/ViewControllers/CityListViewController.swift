//
//  WeatherListViewController.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import UIKit
import CoreLocation

class CityListViewController: UIViewController {

    @IBOutlet weak var tbv: UITableView!
    @IBOutlet weak var searchTxtField: UITextField!
    private var weatherListViewModel:WeatherListViewModel!
    private var cityListViewModel:CityListViewModel!
    private let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherListViewModel = WeatherListViewModel()
        weatherListViewModel.reloadModelList = {
            [weak self]() in self?.tbv.reloadData()
        }
    
        cityListViewModel = CityListViewModel()
        cityListViewModel.reloadModelList = {
            [weak self]() in self?.tbv.reloadData()
        }
        
        tableViewSetup()
    }
    
    
    @IBAction func addCityBtn(_ sender: UIButton) {
        
        if searchTxtField.text?.count ?? 0 > 0 {
            
            geocoder.geocodeAddressString(searchTxtField.text!) {
                placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude
                let lon = placemark?.location?.coordinate.longitude

                self.weatherListViewModel.lat = String(format:"%f", lat!)
                self.weatherListViewModel.lon = String(format:"%f", lon!)
                self.weatherListViewModel.populateSources()
                
                self.cityListViewModel.cityName = self.searchTxtField.text
                self.cityListViewModel.populateSources()
                //remove value form textfield
                self.searchTxtField.text = ""
                self.view.endEditing(true)
            }
        }
        else{
            // alert information
        }
        
    }
    
}

extension CityListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableViewSetup(){
        tbv.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weatherViewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WeatherCell        
        cell.weatherSourceObj = weatherListViewModel.weatherViewModels![indexPath.row]
        if indexPath.row < (cityListViewModel.cityViewModels?.count)! {
            cell.citySourceObj = cityListViewModel.cityViewModels![indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        let showWeatherViewController = self.storyboard?.instantiateViewController(withIdentifier: "showVC") as! ShowWeatherViewController
        showWeatherViewController.showWeatherViewModel.cityInfo = cityListViewModel.cityViewModels![row]
        showWeatherViewController.showWeatherViewModel.weatherInfo = weatherListViewModel.weatherViewModels![row]
        self.navigationController?.pushViewController(showWeatherViewController, animated: true)
    }
    
}
