//
//  CoreDataManager.swift
//  HeavyweightMigration
//
//  Created by Stanley Ejechi on 6/18/19.
//  Copyright © 2019 MobileConsultingSolutions. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
  static var sharedManager = CoreDataManager()
  private init() {}
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "HeavyweightMigration")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unable to load store: \(error), \(error.userInfo)")
      } else {
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = false
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions = [description]
      }
    })
    return container
  }()
  
  func saveContext() {
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let error = error as NSError?
        fatalError("Unable to save: \(error), \(error?.userInfo)")
      }
    }
  }
}
