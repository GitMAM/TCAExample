//
//  TermsOfServiceView.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import SwiftUI
import ComposableArchitecture

private let readMe = """
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis condimentum risus. Sed molestie orci ut ligula congue, in vehicula tortor ultricies. Aliquam dapibus nulla non feugiat eleifend. Cras tellus justo, luctus ut enim eu, viverra volutpat turpis. Proin sed massa at velit tempor rutrum. Vestibulum augue dui, sollicitudin lobortis tellus in, rutrum porta lacus. Sed porttitor vitae libero iaculis imperdiet. Phasellus vestibulum convallis enim vitae imperdiet. Sed aliquet scelerisque nisi aliquam convallis. Sed venenatis vestibulum egestas. Donec sed vulputate erat. Nam porta a enim a laoreet.
  """


struct TermsOfServiceView: View {
  let store: StoreOf<TermsOfService>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Form {
        Text(readMe)
        
        Section {
          Toggle("Agree?", isOn: {
            viewStore.binding(get: \.agreeToTerms, send: TermsOfService.Action.setNavigation(isActive:))
          }())
        }
        Section {
          NavigationLink(
            destination: IfLetStore(
              self.store.scope(
                state: \.credential,
                action: TermsOfService.Action.credential
              )
            ) {
              CredentialView(store: $0)
            }
          ) {
            Text("Continue")
          }.disabled(!viewStore.agreeToTerms)
        }
      }
      .navigationTitle("Terms of Service")
    }
  }
}

