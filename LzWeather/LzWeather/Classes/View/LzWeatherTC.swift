//
//  LzWeatherTC.swift
//  LzWeather
//
//  Created by mc on 2019/5/28.
//  Copyright © 2019年 com.lz.www. All rights reserved.
//

import UIKit

class LzWeatherTC: UITableViewCell {

    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgviewWea: UIImageView!
    @IBOutlet weak var lblWea: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    
    var weatherDay : LzWeatherDay? {
        didSet {
            
            guard let model = weatherDay else {
                return
            }
            debugPrint(model.day!, model.week!, model.date!, model.wea_img!)
            
            lblDay.text = model.day
            lblDate.text = model.date
            imgviewWea.image = UIImage(named: model.wea_img!)
            lblWea.text = model.wea
            lblTemp.text = "温度：" + model.tem2! + " 到 " + model.tem1!
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
