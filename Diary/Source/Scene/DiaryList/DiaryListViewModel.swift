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
  @Published var diaries: [DiaryItem] = []
}

extension DiaryListViewModel {
  func deleteRow(at indexSet: IndexSet) {
    indexSet.forEach { index in
      let diary = diaries[index]
      Task {
        await deleteDiary(diary: diary)
        await fetchDiaries()
      }
    }
  }
  
  @MainActor
  private func deleteDiary(diary: DiaryItem) async {
    setIsLoading(true)
    await Diary.deleteDiary(diary: diary)
    setIsLoading(false)
  }
  
  @MainActor
  func fetchDiaries() async {
    setIsLoading(true)
    diaries = await Diary.fetchAllDiary()
    setIsLoading(false)
  }
  
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
