//
//  Confirmpin.swift
//  TCAExample
//
//  Created by Mohamed Ali on 14/10/2022.
//

import ComposableArchitecture

public struct ConfirmPin: ReducerProtocol {
  public struct State: Equatable {
    var previousPin = ""
    var pin = ""
    var isComplete = false
  }
  
  public enum Action: Equatable {
    case pinChanged(String)
  }
  
  public init() {}
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case let .pinChanged(pin):
        state.pin = pin
        state.isComplete = !pin.isEmpty && pin == state.previousPin
        return .none
      }
    }
  }
}
