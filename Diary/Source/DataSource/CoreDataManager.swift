//
//  CoreDataManager.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import CoreData
import Foundation

final class CoreDataManager {
  static let shared: CoreDataManager = CoreDataManager()
  
  let persistentContainer: NSPersistentContainer
  
  private init() {
    self.persistentContainer = NSPersistentContainer(name: "DiaryModel")
    self.persistentContainer.loadPersistentStores { description, error in
      if let error = error {
        fatalError("Unable to initailize DiaryModel \(error)")
      }
    }
  }
  
  var viewContext: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  lazy var backgroundContext: NSManagedObjectContext = {
    let newbackgroundContext = persistentContainer.newBackgroundContext()
    newbackgroundContext.automaticallyMergesChangesFromParent = true
    return newbackgroundContext
  }()
}
