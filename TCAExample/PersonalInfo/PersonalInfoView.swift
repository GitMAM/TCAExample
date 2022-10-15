//
//  PersonalInfoView.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import SwiftUI
import ComposableArchitecture

struct PersonalInfoView: View {
  let store: StoreOf<PersonalInfo>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Form {
          Section {
            TextField(
              "First Name",
              text: viewStore.binding(get: \.firstName, send: PersonalInfo.Action.firstNameChanged))
            
            TextField(
              "Last Name",
              text: viewStore.binding(get: \.lastName, send: PersonalInfo.Action.lastNameChanged))
            
            TextField(
              "Telephone Number",
              text: viewStore.binding(get: \.phoneNumber, send: PersonalInfo.Action.phoneNumberChanged))
            .keyboardType(.numberPad)
          }
          
          Section {
            NavigationLink(destination: IfLetStore(
              self.store.scope(
                state: \.pin,
                action: PersonalInfo.Action.pin
              )
            ) {
              NewPinVIew(store: $0)
            }
            ) {
              Button("Continue") {
                viewStore.send(.continueTapped)
              }.disabled(!viewStore.isComplete)
              
            }
            
          }
        }
      }
      .navigationTitle("Personal Info")
    }
  }
}
