//
//  ViewController.swift
//  HeavyweightMigration
//
//  Created by Stanley Ejechi on 6/18/19.
//  Copyright © 2019 MobileConsultingSolutions. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  @IBOutlet weak var userTableView: UITableView!
  private var user: [NSManagedObject] = []
  private var countryFlags: [String] = []
  private var dataSource = [UserModel]()
  private var managedObjectContext: NSManagedObjectContext?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    userTableView.dataSource = self
    userTableView.rowHeight = 130
    managedObjectContext = CoreDataManager.sharedManager.persistentContainer.viewContext
    
//    createUser(name: "Sarah", sex: "Female", age: 37, country: "England")
//    createUser(name: "Peter", sex: "Male", age: 21, country: "USA")
//    createUser(name: "Hannah", sex: "Female", age: 23, country: "England")
//    createUser(name: "John", sex: "Male", age: 26, country: "USA")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
//    fetchAllUsers()
        loadUSAUser()
  }
  
//  func createUser(name: String, sex: String, age: Int16, country: String) {
//    let managedObjectContext = CoreDataManager.sharedManager.persistentContainer.viewContext
//    guard let storeEntity = NSEntityDescription.entity(forEntityName: "InternationalUser", in: managedObjectContext) else { return }
//    let internationalUser = NSManagedObject(entity: storeEntity, insertInto: managedObjectContext)
//    internationalUser.setValue(name, forKeyPath: "userName")
//    internationalUser.setValue(sex, forKeyPath: "userSex")
//    internationalUser.setValue(country, forKeyPath: "userCountry")
//    let ageInt16 = Int16(age)
//    internationalUser.setValue(ageInt16, forKeyPath: "userAge")
//    do {
//      try managedObjectContext.save()
//      user.append(internationalUser)
//    } catch {
//      let error = error as NSError?
//      fatalError("Unable to save \(error), \(error?.userInfo)")
//    }
//  }
  
  @objc func loadUSAUser()
  {
    self.title = "USA Users"
    dataSource = [UserModel]();
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "England", style: .plain, target: self, action: #selector(loadEnglandUser))
    //    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "USAUser")
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "USAUser")
    request.returnsObjectsAsFaults = false
    do {
      let result = try self.managedObjectContext?.fetch(request)
      for data in result as! [NSManagedObject]
      {
        let userModel = UserModel()
        userModel.userName = data.value(forKey: "userName") as! String
        userModel.userAge = data.value(forKey: "userAge") as! Int
        userModel.userSex = data.value(forKey: "userSex") as! String
        userModel.userCity = data.value(forKey: "userCity") as! String
        userModel.userCountry = "USA"
        dataSource.append(userModel)
        print(data)
      }
    } catch {
      print("Failed")
    }
    userTableView.reloadData()
  }
  
  @objc func loadEnglandUser()
  {
    self.title = "England Users"
    dataSource = [UserModel]();
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "USA", style: .plain, target: self, action: #selector(loadUSAUser))
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EnglandUser")
    request.returnsObjectsAsFaults = false
    do {
      let result = try managedObjectContext?.fetch(request)
      for data in result as! [NSManagedObject] {
        let userModel = UserModel()
        userModel.userName = data.value(forKey: "userName") as! String
        userModel.userAge = data.value(forKey: "userAge") as! Int
        userModel.userSex = data.value(forKey: "userSex") as! String
        userModel.userCity = data.value(forKey: "userCity") as! String
        userModel.userCountry = "England"
        dataSource.append(userModel)
        print(data)
      }
    } catch {
      print("Failed")
    }
    userTableView.reloadData()
  }
  
  
//  func fetchAllUsers() -> [InternationalUser]? {
//    let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
//    //    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "InternationalUser")
//    let fetchRequest: NSFetchRequest<InternationalUser> = InternationalUser.fetchRequest()
//    do {
//      let users = try managedContext.fetch(fetchRequest)
//      return users as? [InternationalUser]
//    } catch let error as NSError {
//      print("Could not fetch. \(error), \(error.userInfo)")
//      return nil
//    }
//  }
  
  
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
//    return user.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InternationalUsersTableViewCell
        cell.name.text = dataSource[indexPath.row].userName
        let age = dataSource[indexPath.row].userAge
        let ageString = String(age)
        cell.age.text = ageString
        cell.sex.text = dataSource[indexPath.row].userSex
        cell.country.text = dataSource[indexPath.row].userCity
        countryFlags.append(dataSource[indexPath.row].userCountry)
        cell.imageView?.image = UIImage(named: countryFlags[indexPath.row])
    
    
//    cell.name.text = user[indexPath.row].value(forKeyPath: "userName") as? String
//    let age = user[indexPath.row].value(forKeyPath: "userAge") as! Int16 ?? 0
//    let stringAge = String(age)
//    cell.age.text = stringAge
//    cell.sex.text = user[indexPath.row].value(forKeyPath: "userSex") as? String
//
//    cell.country.text = user[indexPath.row].value(forKeyPath: "userCountry") as? String
    
    return cell
  }
  
  
}

