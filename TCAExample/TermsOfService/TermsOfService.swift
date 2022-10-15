//
//  TermsOfService.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import ComposableArchitecture

public struct TermsOfService: ReducerProtocol {
  
  public struct State: Equatable {
    var credential: Credential.State? = nil
    var agreeToTerms: Bool = false
  }
  
  public enum Action: Equatable {
    case setNavigation(isActive: Bool)
    case credential(Credential.Action)
  }
  
  public init() {}
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case let .setNavigation(present):
        state.credential = present ? Credential.State() : nil
        state.agreeToTerms = present
        return .none
  
      case .credential:
        return .none
      }
    }
    .ifLet(\.credential, action: /Action.credential) {
      Credential()
    }
  }
}
