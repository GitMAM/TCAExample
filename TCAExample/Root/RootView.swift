
//  RootView.swift
//  TCAExample
//
//  Created by Mohamed Ali on 12/10/2022.


import SwiftUI
import ComposableArchitecture

public struct RootView: View {
  let store: StoreOf<Root>
  
  public init(store: StoreOf<Root>) {
    self.store = store
  }
  
  public var body: some View {
    SwitchStore(self.store) {
      CaseLet(state: /Root.State.welcome, action: Root.Action.welcome) { store in
        NavigationView {
          WelcomeView(store: store)
        }
        .navigationViewStyle(.stack)
      }
      
      CaseLet(state: /Root.State.home, action: Root.Action.home) { store in
        NavigationView {
          HomeView(store: store)
        }
        .navigationViewStyle(.stack)
      }
    }.navigationBarBackButtonHidden(true)
  }
}
