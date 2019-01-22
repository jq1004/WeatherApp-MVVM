//
//  ShowWeatherViewController.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import UIKit

class ShowWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var precipitationLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var cityImg: UIImageView!
    @IBOutlet weak var containterView: UIView!
    @IBOutlet weak var dailyWeatherView: UIView!
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    let showWeatherViewModel:ShowWeatherViewModel = ShowWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateUI()
    }
    
    func setupView(){
        containterView.layer.cornerRadius = 12
        cityImg.layer.cornerRadius = 12
        dailyWeatherView.layer.cornerRadius = 12
    }
    
    func updateUI(){
        cityName.text = showWeatherViewModel.cityInfo?.cityName
        dayLbl.text = showWeatherViewModel.weatherInfo?.day
        weatherLbl.text = showWeatherViewModel.weatherInfo?.icon
        precipitationLbl.text = "Precipitation : " + (showWeatherViewModel.weatherInfo?.precipitation)! + "%"
        humidityLbl.text = "Humidity : " + (showWeatherViewModel.weatherInfo?.humidity)! + "%"
        windLbl.text = "Wind : " + (showWeatherViewModel.weatherInfo?.wind)! + " m/s"
        highTempLbl.text = (showWeatherViewModel.weatherInfo?.highTemp)! + "°F"
        lowTempLbl.text = (showWeatherViewModel.weatherInfo?.lowTemp)! + "°F"
        
        
        cityImg.af_setImage(withURL: (showWeatherViewModel.cityInfo?.imgUrl)!)
    }

}

extension ShowWeatherViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DailyWeatherCell
        
        return cell
    }
    
    
}
