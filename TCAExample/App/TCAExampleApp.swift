//
//  TCAExampleApp.swift
//  TCAExample
//
//  Created by Mohamed Ali on 12/10/2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAExampleApp: App {
  @Preference(\.isUserLoggedIn) var isUserLoggedIn
  
  var body: some Scene {
    WindowGroup {
      RootView(
        store: Store(
          initialState: Root.State(
            state: isUserLoggedIn ? .home(Home.State()) : .welcome(Welcome.State())
          ), reducer: Root()
        )
      )
    }
  }
}
