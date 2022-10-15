//
//  ConfirmPinView.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import SwiftUI
import ComposableArchitecture

struct ConfirmPinView: View {
  let store: StoreOf<ConfirmPin>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Form {
        SecureField(
          "••••••••",
          text: viewStore.binding(get: \.pin, send: ConfirmPin.Action.pinChanged)
        ).keyboardType(.numberPad)
        
        Section {
          NavigationLink(
            destination: RootView(store: Store(initialState: Root.State(state: .home(Home.State())), reducer: Root()))
          ) {
            Button("Continue") {}.disabled(!viewStore.isComplete)
          }
        }
      }
      .navigationTitle("Confirm Pin")
    }
  }
}
