//
//  DiaryDetailView.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import SwiftUI

struct DiaryDetailView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject var diaryDetailVM: DiaryDetailViewModel
  
  var body: some View {
    VStack {
      // 네비게이션 바
      DiaryNavigationBar(
        isDisplayBackButton: true,
        backButtonAction: {
          dismiss()
        }
      )
      
      // 제목
      TitleView(title: diaryDetailVM.diary.title)
      
      // 날짜
      DateView(date: diaryDetailVM.diary.publishedAt)
      
      // 내용
      ContentView(content: diaryDetailVM.diary.content)
      
      Spacer()
    }
    .toolbar(.hidden)
  }
}

private struct TitleView: View {
  fileprivate let title: String
  
  var body: some View {
    HStack {
      Spacer()
      Text("제목: \(title)")
        .font(.title)
      Spacer()
    }
  }
}

private struct DateView: View {
  fileprivate let date: String
  
  var body: some View {
    HStack {
      Spacer()
      Text("작성일: \(date)")
        .font(.subheadline)
      Spacer()
    }
  }
}

private struct ContentView: View {
  fileprivate let content: String
  
  var body: some View {
    HStack {
      Text(content)
        .frame(alignment: .leading)
        .font(.body)
      Spacer()
    }
    .padding()
  }
}

struct DiaryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let diary = Diary(context: Diary.viewContext)
    diary.title = "hi"
    diary.content = "googood"
    diary.publishedAt = .now
    let diaryItem = DiaryItem(diary: diary)
    return DiaryDetailView(diaryDetailVM: .init(diary: diaryItem))
  }
}
