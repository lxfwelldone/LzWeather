//
//  ViewController.swift
//  LzWeather
//
//  Created by mc on 2019/3/30.
//  Copyright © 2019年 com.lz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AMapLocationKit


class ViewController: UIViewController {

    //定位的区域名称
    private var areaName : String?
    //定位管理器
    private lazy var locationManager : AMapLocationManager = { [weak self] in
        let manager = AMapLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.locationTimeout = 2
        manager.reGeocodeTimeout = 2
        manager.delegate = self
        return manager
    }()
    
    //显示定位信息
    private lazy var lblAddress : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = NSTextAlignment.center
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = NSLineBreakMode.byCharWrapping
        return lbl
    }()
    
    private lazy var tableView : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = nil
        return table
    }()

    private var tableData : [LzWeatherDay] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        //定位成功并获取到区域名称
        singleLocationResult { [weak self] (areaName: String?, success: Bool)  in
            guard let cityName = areaName else {
                debugPrint("定位失败了")
                return
            }
            
            //通过名称获取到 天气城市model
            let weatherCity : LzCity? = LzCity.getCityByName(cityName: cityName, cities: LzCity.loadCities()!)
            debugPrint(weatherCity!)
            
            //通过城市id 获取7天天气情况
            self?.loadWeatherDataByCityId(cityId: (weatherCity?.id)!, callBack: { (wea7: LzWeather7?) in
                
                self?.tableData.removeAll()
                self?.tableView.reloadData()

                for item : LzWeatherDay in (wea7?.data)! {
                    self?.tableData.append(item)
                }
                self?.tableView.reloadData()
            })
        }
    }
}

//MARK: 初始化
extension ViewController {
    
    func initUI(){
        
        self.lblAddress.frame = CGRect(x: 0, y: 10, width: LzConstant.Lz_screen_width, height: 30)
        self.view.addSubview(self.lblAddress)
        
        self.tableView.frame = CGRect(x: 0, y: 50, width: LzConstant.Lz_screen_width, height: LzConstant.Lz_screen_height-50)
        self.view.addSubview(self.tableView)
        
        registCell()
    }
}


//MARK: table代理实现
extension ViewController : UITableViewDataSource, UITableViewDelegate {

    private static let Lz_CellID_UITableViewCell : String = "Lz_CellID_UITableViewCell"
    
    func registCell(){
        self.tableView.register(UINib(nibName: "LzWeatherTC", bundle: nil), forCellReuseIdentifier: ViewController.Lz_CellID_UITableViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ViewController.Lz_CellID_UITableViewCell) as! LzWeatherTC
        let weatherDay : LzWeatherDay = self.tableData[indexPath.row]
        cell.weatherDay = weatherDay
        return cell
    }

}

//MARK: 定位代理实现
extension ViewController : AMapLocationManagerDelegate{

    func singleLocationResult(callBack :@escaping (_ areaName: String?, _ success: Bool) -> () ){
        self.locationManager.requestLocation(withReGeocode: true, completionBlock: { (location: CLLocation?, reGeocode: AMapLocationReGeocode?, error: Error?) in
            
            if let error = error {
                let error = error as NSError
                
                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
                    debugPrint("定位错误:{\(error.code) - \(error.localizedDescription)};")
                    return
                }
                else if error.code == AMapLocationErrorCode.reGeocodeFailed.rawValue
                    || error.code == AMapLocationErrorCode.timeOut.rawValue
                    || error.code == AMapLocationErrorCode.cannotFindHost.rawValue
                    || error.code == AMapLocationErrorCode.badURL.rawValue
                    || error.code == AMapLocationErrorCode.notConnectedToInternet.rawValue
                    || error.code == AMapLocationErrorCode.cannotConnectToHost.rawValue {
                    
                    //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
                    debugPrint("逆地理错误:{\(error.code) - \(error.localizedDescription)};")
                }
                else {
                    //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
                }
            }

            guard let reGeocode = reGeocode  else {
                debugPrint("定位失败了")
                return
            }
//
//            guard let location = location else {
//                debugPrint("定位失败了")
//                return
//            }

            var area : String? = nil
            if let cityName = reGeocode.city {
                area = cityName
            }
            if let district = reGeocode.district {
                area = district
            }
            callBack(area, true)
        })
    }

    /** iOS 11 必须实现的协议方法 */
    func amapLocationManager(_ manager: AMapLocationManager!, doRequireLocationAuth locationManager: CLLocationManager!) {
        locationManager.requestAlwaysAuthorization()
    }
}


//MARK: 网络请求获取天气数据
extension ViewController {

    /*
     * 根据 城市id 获取天气数据
     */
    func loadWeatherDataByCityId(cityId: String, callBack :@escaping (_ weather : LzWeather7? ) -> () ) {
//        https://www.tianqiapi.com/api/?version=v1&cityid=101110101
        let urlStr : String = "https://www.tianqiapi.com/api/?version=v1&cityid="+cityId
        Alamofire.request(urlStr).responseJSON { response in
            debugPrint(response.result.value!)

            let wea7 = LzWeather7.deserialize(from: response.result.value! as? Dictionary)
            callBack(wea7)
        }
    }
}

