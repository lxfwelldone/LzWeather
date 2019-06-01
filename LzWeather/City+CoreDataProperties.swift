//
//  City+CoreDataProperties.swift
//  
//
//  Created by mc on 2019/3/31.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var id: String?
    @NSManaged public var cityEn: String?
    @NSManaged public var cityZh: String?
    @NSManaged public var provinceEn: String?
    @NSManaged public var provinceZh: String?
    @NSManaged public var leaderEn: String?
    @NSManaged public var leaderZh: String?
    @NSManaged public var lat: Double
    @NSManaged public var lon: Double

}
