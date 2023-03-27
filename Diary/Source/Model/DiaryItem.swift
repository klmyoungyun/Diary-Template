//
//  DiaryItem.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import CoreData
import Foundation

struct DiaryItem {
  private let diary: Diary
  
  init(diary: Diary) {
    self.diary = diary
  }
  
  var id: NSManagedObjectID {
    return diary.objectID
  }
  
  var title: String {
    return diary.title ?? ""
  }
  
  var content: String {
    return diary.content ?? ""
  }
  
  var publishedAt: String {
    return diary.publishedAt?.currentDateToString() ?? ""
  }
}
