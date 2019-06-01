//
//  LzWeather7.swift
//  LzWeather
//
//  Created by mc on 2019/5/14.
//  Copyright © 2019年 com.lz.www. All rights reserved.
//

import UIKit

class LzWeather7 : LzBaseModel{
    
    //当前城市ID
    var cityId : String?
    
    //气象台更新时间
    var update_time : String?
    
    //当前城市名称
    var city : String?
    
    //当前城市名称英文
    var cityEn : String?
    
    //当前国家
    var country : String?
    
    //当前国家英文
    var countryEN : String?
    
    //7天天气数据
    var data : [LzWeatherDay]?
    
}
