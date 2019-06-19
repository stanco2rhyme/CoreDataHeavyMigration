//
//  UserModel.swift
//  HeavyweightMigration
//
//  Created by Stanley Ejechi on 6/19/19.
//  Copyright © 2019 MobileConsultingSolutions. All rights reserved.
//

import Foundation
import CoreData

class UserModel: NSManagedObject {
  var userName = String()
  var userAge = Int()
  var userSex = String()
  var userCity = String()
  var userCountry = String()
}
