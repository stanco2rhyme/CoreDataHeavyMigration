//
//  InternationalUser+CoreDataProperties.swift
//  HeavyweightMigration
//
//  Created by Stanley Ejechi on 6/18/19.
//  Copyright © 2019 MobileConsultingSolutions. All rights reserved.
//
//

import Foundation
import CoreData


extension InternationalUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InternationalUser> {
        return NSFetchRequest<InternationalUser>(entityName: "InternationalUser")
    }

    @NSManaged public var userSex: String?
    @NSManaged public var userCountry: String?
    @NSManaged public var userAge: Int16
    @NSManaged public var userName: String?

}
