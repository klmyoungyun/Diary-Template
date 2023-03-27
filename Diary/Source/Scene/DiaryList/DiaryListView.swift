//
//  DiaryListView.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import SwiftUI

struct DiaryListView: View {
  @StateObject var diaryListVM: DiaryListViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        // 네비게이션 바
        DiaryNavigationBar(
          isDisplayWritingButton: true,
          writingButtonAction:  {
            diaryListVM.setIsMoveToDiaryWritingMode(true)
          }
        )
        
        // 다이어리 리스트
        DiariesView(diaryListVM: diaryListVM)
        
        Spacer()
      }
      .sheet(
        isPresented: $diaryListVM.isMoveToDiaryWritingMode,
        onDismiss: {
          Task {
            await diaryListVM.fetchDiaries()
          }
        },
        content: {
          DiaryWritingView(diaryWritingVM: .init())
        }
      )
      .task {
        await diaryListVM.fetchDiaries()
      }
    }
  }
}

private struct DiariesView: View {
  @ObservedObject fileprivate var diaryListVM: DiaryListViewModel
  
  var body: some View {
    List {
      ForEach(diaryListVM.diaries, id: \.id) { diary in
        ZStack {
          // 일기 내용 뷰 이동 링크
          NavigationLink {
            DiaryDetailView()
          } label: {
            EmptyView()
          }
          .opacity(0)
          // 일기 리스트의 셀 뷰
          DiaryRow(diary: diary)
        }
      }
      .onDelete(perform: diaryListVM.deleteRow)
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
    .refreshable {
      await diaryListVM.fetchDiaries()
    }
  }
}

struct DiaryListView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryListView(diaryListVM: .init())
  }
}
