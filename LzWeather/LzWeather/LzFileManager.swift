//
//  JSONReader.swift
//  LzWeather
//
//  Created by mc lxf 2019/3/31.
//  Copyright © 2019年 com.lz. All rights reserved.
//

import Foundation

class FileReader{
    
    /**
     * 获取json文件内容
     */
    class func readJsonFile(filePath:String) -> String {
        var jsonStr : String? = nil
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath))
            jsonStr = String(data: jsonData, encoding: .utf8)
        } catch let error as Error? {
            debugPrint("读取本地数据出现错误", error as Any)
        }
        return jsonStr!
    }
    
    
    
}

class FileWriter {
   class func returnString() -> String {
        return "123456"
    }
}
