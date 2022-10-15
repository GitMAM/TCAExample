//
//  NewPinVIew.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import SwiftUI
import ComposableArchitecture

struct NewPinVIew: View {
  let store: StoreOf<Pin>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Form {
        SecureField(
          "••••••••",
          text: viewStore.binding(get: \.pin, send: Pin.Action.pinChanged)
        ).keyboardType(.numberPad)
        
        Section {
          NavigationLink(destination: IfLetStore(
            self.store.scope(
              state: \.confirmPin,
              action: Pin.Action.confirmPin
            )
          ) {
            ConfirmPinView(store: $0)
          }
          ) {
            Button("Continue") {
              viewStore.send(.continueTapped)
            }.disabled(!viewStore.isComplete)
          }
        }
      }
      .navigationTitle("Pin")
    }
  }
}
