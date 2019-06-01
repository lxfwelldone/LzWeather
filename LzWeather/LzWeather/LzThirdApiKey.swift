//
//  LzThirdApiKey.swift
//  LzWeather
//
//  Created by mc on 2019/5/14.
//  Copyright © 2019年 com.lz.www. All rights reserved.
//

import UIKit
import AMapLocationKit

class LzThirdApiKey{

    #if DEBUG
    static let apiKey_GDMap = "9c7bd5a38a880f1fc92e787f07a84312"
    #else
    static let apiKey_GDMap = "9c7bd5a38a880f1fc92e787f07a84312"
    #endif
    /**
    配置所有的第三方key
    不需要的第三方注释即可
    */
    static func configAllKeys(){
        //高德地图
        AMapServices.shared().apiKey = LzThirdApiKey.apiKey_GDMap

        
        //其他。。。
    }
    
}
