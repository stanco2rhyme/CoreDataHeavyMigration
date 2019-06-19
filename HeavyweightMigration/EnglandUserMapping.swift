//
//  EnglandUserMapping.swift
//  HeavyweightMigration
//
//  Created by Stanley Ejechi on 6/18/19.
//  Copyright © 2019 MobileConsultingSolutions. All rights reserved.
//

import UIKit
import CoreData

class EnglandUserMapping: NSEntityMigrationPolicy {
  
  override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
    if sInstance.entity.name == "InternationalUser" {
      let userName = sInstance.primitiveValue(forKey: "userName") as! String
      let userAge = sInstance.primitiveValue(forKey: "userAge") as! Int
      let userSex = sInstance.primitiveValue(forKey: "userSex") as! String
      
      let userCity = sInstance.primitiveValue(forKey: "userCity") as! String
      let userCountry = sInstance.primitiveValue(forKey: "userCountry") as! String
      
      if userCountry == "England" {
        let usaUser = NSEntityDescription.insertNewObject(forEntityName: "USAUser", into: manager.destinationContext)
        usaUser.setValue(userName, forKey: "userName")
        usaUser.setValue(userAge, forKey: "userAge")
        usaUser.setValue(userSex, forKey: "userSex")
        if userCity == "Manchester" {
          usaUser.setValue("Liverpool", forKey: "userCity")
        } else {
          usaUser.setValue(userCity, forKey: "userCity")
        }
      }
    }
  }
  
}
