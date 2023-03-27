//
//  Date+Extension.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import Foundation

extension Date {
  func currentDateToString() -> String {
    return dateFormatter.string(from: self)
  }
}

fileprivate let dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.locale = Locale(identifier: "ko_kr")
  formatter.dateFormat = "yyyy년 MM월 dd일"
  return formatter
}()
