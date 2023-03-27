//
//  DiaryRow.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import SwiftUI

struct DiaryRow: View {
  let diary: DiaryItem
  
  var body: some View {
    ZStack {
      Image("DiaryCard")
      VStack(spacing: 0) {
        Spacer().frame(height: 75)
        title
        Spacer()
      }
    }
    .frame(width: 300, height: 115)
  }
}

extension DiaryRow {
  var title: some View {
    HStack {
      Spacer()
      Text(diary.title)
        .font(.headline)
        .lineLimit(1)
      Spacer()
    }
  }
}

struct DiaryRow_Previews: PreviewProvider {
  static var previews: some View {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    let diary = Diary(context: context)
    diary.title = "제목입니다."
    diary.content = "내용입니다."
    diary.publishedAt = .now
    return DiaryRow(diary: DiaryItem(diary: diary))
  }
}
