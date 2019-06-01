//
//  NetworkTool.swift
//  LzWeather
//
//  Created by mc on 2019/5/16.
//  Copyright © 2019年 com.lz.www. All rights reserved.
//

import UIKit

import Alamofire


enum MethodType {
    case POST
    case GET
}

class NetworkTool : NSObject{

    public func getData(_ url : URLConvertible, params : Parameters? = nil) -> DataRequest{
        return Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: nil)
    }
}
