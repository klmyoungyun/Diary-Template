//
//  DiaryListViewModel.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var isMoveToDiaryWritingMode: Bool = false
}

extension DiaryListViewModel {
  // MARK: 프로퍼티 셋업
  @MainActor
  func setIsLoading(_ state: Bool) {
    isLoading = state
  }
  
  @MainActor
  func setIsMoveToDiaryWritingMode(_ state: Bool) {
    isMoveToDiaryWritingMode = state
  }
}
