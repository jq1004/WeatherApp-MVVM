//
//  DailyWeatherCell.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/22/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import UIKit

class DailyWeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var weatherImgView: UIImageView!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    
    var dailyWeatherObj: WeatherSource? {
        didSet{
            cellDataSet()
        }
    }
    
    func cellDataSet(){
        dayLbl.text = dailyWeatherObj?.day
        
        if dailyWeatherObj!.icon.contains("Cloudy") {
            weatherLbl.text = "Cloudy"
        }
        else { weatherLbl.text = dailyWeatherObj!.icon}
        
        print(dailyWeatherObj!.icon)
        weatherImgView.image = UIImage(named: dailyWeatherObj!.icon.lowercased())
        
        highTempLbl.text = (dailyWeatherObj?.highTemp)! + "°F"
        lowTempLbl.text = (dailyWeatherObj?.lowTemp)! + "°F"
    }
}
