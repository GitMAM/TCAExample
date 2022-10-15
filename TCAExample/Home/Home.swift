//
//  Home.swift
//  TCAExample
//
//  Created by Mohamed Ali on 12/10/2022.
//

import ComposableArchitecture

public struct Home: ReducerProtocol {
  public struct State: Equatable {
    public var logOutTapped = false
    
    public init() {}
    
  }
  
  public enum Action: Equatable {
    case logoutTapped
  }
    
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case .logoutTapped:
        state.logOutTapped = true
      }
      
      return .none
    }
  }
}
