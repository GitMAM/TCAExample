//
//  CredintialView.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import SwiftUI
import ComposableArchitecture

struct CredentialView: View {
  let store: StoreOf<Credential>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Form {
          Section {
            TextField(
              "Email",
              text: viewStore.binding(get: \.email, send: Credential.Action.emailFieldChanged))
            .autocapitalization(.none)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            
            SecureField(
              "••••••••",
              text: viewStore.binding(get: \.password, send: Credential.Action.passwordFieldChanged))
          }
          
          Section {
            NavigationLink(destination: IfLetStore(
              self.store.scope(
                state: \.personalInfo,
                action: Credential.Action.personalInfo
              )
            ) {
              PersonalInfoView(store: $0)
            }
            ) {
              Button("Continue") {
                viewStore.send(.continueTapped)
              }.disabled(!viewStore.isComplete)
              
            }
          }
        }
      }
      .navigationTitle("Credentials")
    }
  }
}
