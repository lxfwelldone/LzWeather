//
//  LzCity.swift
//  LzWeather
//
//  Created by mc on 2019/5/28.
//  Copyright © 2019年 com.lz.www. All rights reserved.
//

import UIKit

/**
 * 天气预报的城市模型
 */
class LzCity : LzBaseModel {
    
    /**
     * 区域编号
     */
    var id : String?
    
    /**
     * 区域名称
     */
    var cityEn : String?
    var cityZh : String?
    
    /**
     * 所属 省
     */
    var provinceEn : String?
    var provinceZh : String?
    /**
     * 所属 市
     */
    var leaderEn : String?
    var leaderZh : String?
    /**
     * 经纬度
     */
    var lat : String?
    var lon : String?

}

//添加类方法
extension LzCity {
    /*
     * 读取json文件，获取所有的天气 城市model
     */
   class func loadCities() -> [LzCity]?{
        let path = Bundle.main.path(forResource: "city", ofType: "json")
        let jsonCities : String = FileReader.readJsonFile(filePath: path!);
        debugPrint(jsonCities)
        
        if let cities = [LzCity].deserialize(from: jsonCities) {
            return cities as? [LzCity]
        }
        return nil
    }
    
    /*
     * 通过城市名称获取对应的城市model
     */
    class func getCityByName(cityName: String, cities: [LzCity]) -> LzCity? {
        var city : LzCity? = nil
        if cities.count > 0 {
            for c in cities {
                if c.cityZh!.elementsEqual(cityName) || cityName.contains(c.cityZh!) {
                    city = c
                    break
                }
            }
        }
        return city
    }
}
