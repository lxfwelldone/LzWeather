//
//  LzNetTool.swift
//  LzWeather
//
//  Created by mc on 2019/5/16.
//  Copyright © 2019年 com.lz.www. All rights reserved.
//

import UIKit
import Alamofire

class LzNetTool {
    
    public func loadData(){
        let params :[String: Any]? = ["account" : "158xxxxxx"]
        Alamofire.request("", method: HTTPMethod.post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON {  response in
            
        }
    }
}
