//
//  Root.swift
//  TCAExample
//
//  Created by Mohamed Ali on 12/10/2022.
//

import ComposableArchitecture
import SwiftUI

public struct Root: ReducerProtocol {
  public enum State: Equatable {
    case welcome(Welcome.State)
    case home(Home.State)
    
    public init(state: State) { self = state }
  }
  
  public enum Action: Equatable {
    case welcome(Welcome.Action)
    case home(Home.Action)
  }
  
  public init() {}
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case .welcome:
        return .none
        
      case .home(.logoutTapped):
        state = .welcome(Welcome.State())
        return .none
      }
    }
    .ifCaseLet(/State.home, action: /Action.home) {
      Home()
    }
    
    .ifCaseLet(/State.welcome, action: /Action.welcome) {
      Welcome()
    }
  }
}

