//
//  DiaryNavigationBar.swift
//  Diary
//
//  Created by 김영균 on 2023/03/25.
//

import SwiftUI

struct DiaryNavigationBar: View {
  var isDisplayBackButton: Bool
  var isDisplayWritingButton: Bool
  var backButtonAction: () -> Void
  var writingButtonAction: () -> Void
  
  init(
    isDisplayBackButton: Bool = false,
    isDisplayWritingButton: Bool = false,
    backButtonAction: @escaping () -> Void = {},
    writingButtonAction: @escaping () -> Void = {}
  ) {
    self.isDisplayBackButton = isDisplayBackButton
    self.isDisplayWritingButton = isDisplayWritingButton
    self.backButtonAction = backButtonAction
    self.writingButtonAction = writingButtonAction
  }
  
  var body: some View {
    HStack {
      if isDisplayBackButton {
        Button(action: backButtonAction) {
          HStack {
            Image(systemName: "chevron.backward")
              .resizable()
              .foregroundColor(.black)
              .frame(width: 12, height: 24, alignment: .center)
            Text("뒤로가기")
              .font(.system(size: 16))
              .foregroundColor(.black)
          }
          .padding(8)
        }
      }
      
      Spacer()
      
      if isDisplayWritingButton {
        Button(action: writingButtonAction) {
          HStack {
            Image(systemName: "pencil.and.outline")
              .resizable()
              .foregroundColor(.black)
              .frame(width: 24, height: 24, alignment: .center)
            Text("일기 쓰기")
              .font(.system(size: 16))
              .foregroundColor(.black)
          }
          .padding(8)
        }
      }
    }
    .frame(height: 48, alignment: .center)
    .background(.white)
  }
}
