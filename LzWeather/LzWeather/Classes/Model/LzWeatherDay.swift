//
//  LzWeatherDay.swift
//  LzWeather
//
//  Created by mc on 2019/5/14.
//  Copyright © 2019年 com.lz.www. All rights reserved.
//

import UIKit

class LzWeatherDay : LzBaseModel {
    
    //哪一天 今天，明天。。。
    var day: String?
    
    //年月日
    var date: String?
    
    //星期一
    var week: String?
    
    //天气
    var wea: String?
    
    //天气对应图标名称
    var wea_img: String?
    
    //空气质量
    var air: String?
    
    //空气湿度
    var humidity: String?
    
    //空气质量等级
    var air_level: String?
    
    //空气质量描述
    var air_tips: String?
    
    //预警信息 alarm_type=预警类型  alarm_level=预警级别  alarm_content=预警内容
    var alarm: Dictionary<String, String>?
    
    //白天最高温度
    var tem1: String?
    
    //夜晚最低温度
    var tem2: String?
    
    //当前温度
    var tem: String?
    
    //风向
    var win: String?
    
    //风速
    var win_speed: String?
    
    //小时天气
    var hours: [LzWeatherHour]?
    
    //生活指数
    var index: [LzWeatherDayIndex]?
    
}
