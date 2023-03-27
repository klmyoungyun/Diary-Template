//
//  DiaryWritingViewModel.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import Foundation

final class DiaryWritingViewModel: ObservableObject {
  @Published var title: String = ""
  @Published var content: String = ""
}

extension DiaryWritingViewModel {
  @MainActor
  func saveDiary() async {
    await Diary.saveDiary(title: title, content: content)
  }
}
