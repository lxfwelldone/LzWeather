//
//  LzConstant.swift
//  LzWeather
//
//  Created by mc on 2019/5/28.
//  Copyright © 2019年 com.lz.www. All rights reserved.
//

import UIKit

class LzConstant {
    #if DEBUG
    //              测试环境
    static let Lz_url_base = "http://app.zafu.edu.cn/app"
    #else
    //              正式环境
    static let Lz_url_base = "http://app.zafu.edu.cn/app"
    
    #endif
    
    //屏幕的宽高
    static let Lz_screen_width = UIScreen.main.bounds.size.width
    static let Lz_screen_height = UIScreen.main.bounds.size.height
    //获取主窗口
    static let Lz_keyWindow = UIApplication.shared.keyWindow

}

