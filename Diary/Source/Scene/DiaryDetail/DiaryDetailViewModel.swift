//
//  DiaryDetailViewModel.swift
//  Diary
//
//  Created by 김영균 on 2023/03/26.
//

import Foundation

final class DiaryDetailViewModel: ObservableObject {
  @Published var diary: DiaryItem
  
  init(diary: DiaryItem) {
    self.diary = diary
  }
}
