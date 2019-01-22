//
//  WeatherCell.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import UIKit
import AlamofireImage
class WeatherCell: UITableViewCell {

    @IBOutlet weak var cityNamelbl: UILabel!
    @IBOutlet weak var highTemplbl: UILabel!
    @IBOutlet weak var lowTemplbl: UILabel!
    @IBOutlet weak var cityImg: UIImageView!
    @IBOutlet weak var outerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.layer.cornerRadius = 12
        cityImg.layer.cornerRadius = 12
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    var weatherSourceObj: WeatherSource?{
        didSet{
            cellWDataSet()
        }
    }
    
    var citySourceObj:CitySource?{
        didSet{
            cellCDataSet()
        }
    }
    
    func cellWDataSet(){
        highTemplbl.text = (weatherSourceObj?.highTemp)! + "°F"
        lowTemplbl.text = (weatherSourceObj?.lowTemp)! + "°F"
    }
    func cellCDataSet(){
        cityNamelbl.text = citySourceObj?.cityName.capitalized
        cityImg.af_setImage(withURL: (citySourceObj?.imgUrl)!)
    }
}
