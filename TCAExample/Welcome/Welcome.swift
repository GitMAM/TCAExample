//
//  WelcomeCore.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import ComposableArchitecture

public struct Welcome: ReducerProtocol {
  public struct State: Equatable {
    var termsOfService: TermsOfService.State? = nil
  }
  
  public enum Action: Equatable {
    case setNavigation(isActive: Bool)
    case termsOfService(TermsOfService.Action)
  }
  
  public init() {}
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case let .setNavigation(present):
        state.termsOfService = present ? TermsOfService.State() : nil
        return .none
      case .termsOfService:
        return .none
      }
    }
    .ifLet(\.termsOfService, action: /Action.termsOfService) {
      TermsOfService()
    }
  }
}
