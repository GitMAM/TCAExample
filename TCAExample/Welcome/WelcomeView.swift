//
//  WelcomeView.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import SwiftUI
import ComposableArchitecture

struct WelcomeView: View {
  let store: StoreOf<Welcome>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Form {
        Section {
          Text("Welcome to the app")
        }
        NavigationLink(
          destination:
            TermsOfServiceView(store: Store(initialState: TermsOfService.State(), reducer: TermsOfService()))
          ) {
            Text("Tap to Continue")
          }
      }
      .navigationTitle("Hello")
    }
  }
}




