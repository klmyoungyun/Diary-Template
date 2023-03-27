//
//  Diary+NSFetchRequest.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import CoreData
import Foundation

extension Diary {
  static var viewContext: NSManagedObjectContext {
    return CoreDataManager.shared.viewContext
  }
  
  static var backgroundContext: NSManagedObjectContext {
    return CoreDataManager.shared.backgroundContext
  }
  
  static var all: NSFetchRequest<Diary> = {
    let request: NSFetchRequest<Diary> = Diary.fetchRequest()
    request.sortDescriptors = [.init(keyPath: \Diary.publishedAt, ascending: true)]
    return request
  }()
  
  private static func byId(in context: NSManagedObjectContext, id: NSManagedObjectID) -> Diary? {
    do {
      return try context.existingObject(with: id) as? Diary
    } catch {
      return nil
    }
  }
  
  private static func fetchDiaryFaults() async -> [Diary] {
    let diaries: [Diary] = await backgroundContext.perform {
      do {
        return try backgroundContext.fetch(Diary.all)
      } catch {
        return []
      }
    }
    return diaries
  }
  
  static func fetchAllDiary() async -> [DiaryItem] {
    let diariesID = await fetchDiaryFaults().map { $0.objectID}
    return diariesID.compactMap{ Diary.byId(in: viewContext, id: $0) }.map(DiaryItem.init)
  }
  
 
  static func deleteDiary(diary: DiaryItem) async {
    await backgroundContext.perform {
      let diary = byId(in: backgroundContext, id: diary.id)
      do {
        if let diary = diary {
          backgroundContext.delete(diary)
          try backgroundContext.save()
        }
      } catch {
        backgroundContext.rollback()
      }
    }
  }
  
  static func saveDiary(title: String, content: String) async {
    await backgroundContext.perform {
      let diary = Diary(context: backgroundContext)
      diary.title = title
      diary.content = content
      diary.publishedAt = Date.now
      do {
        try backgroundContext.save()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}
