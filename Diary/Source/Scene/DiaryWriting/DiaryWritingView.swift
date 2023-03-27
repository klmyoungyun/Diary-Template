//
//  DiaryWritingView.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//


import SwiftUI

struct DiaryWritingView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject var diaryWritingVM: DiaryWritingViewModel
  
  var body: some View {
    VStack {
      // 제목
      TextField("제목", text: $diaryWritingVM.title)
        .padding()
        .border(.black)
      
      // 본문
      TextEditor(text: $diaryWritingVM.content)
        .border(.black)
      
      // 저장 버튼
      Button("save") {
        Task {
          await diaryWritingVM.saveDiary()
          dismiss()
        }
      }
    }
    .padding()
  }
}

struct DiaryWritingView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryWritingView(diaryWritingVM: .init())
  }
}
