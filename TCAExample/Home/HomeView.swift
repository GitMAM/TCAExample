//
//  HomeView.swift
//  TCAExample
//
//  Created by Mohamed Ali on 12/10/2022.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
  let store: StoreOf<Home>
  
  @Preference(\.username) var username
  @Preference(\.isUserLoggedIn) var isUserLoggedIn
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Form  {
        Text("Hello, \(username)!")
      }.navigationBarItems(trailing: Button("Logout") {
        isUserLoggedIn = false
        viewStore.send(.logoutTapped)
      })
      .navigationBarBackButtonHidden(true)
    }.onAppear {
      isUserLoggedIn = true
    }
  }
}
