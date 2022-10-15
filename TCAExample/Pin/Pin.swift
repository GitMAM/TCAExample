//
//  Pin.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import ComposableArchitecture

public struct Pin: ReducerProtocol {
  public struct State: Equatable {
    var pin = ""
    var isComplete = false
    var confirmPin: ConfirmPin.State? = nil
  }
  
  public enum Action: Equatable {
    case continueTapped
    case pinChanged(String)
    case confirmPin(ConfirmPin.Action)
  }
  
  public init() {}
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case let .pinChanged(pin):
        state.pin = pin
        state.isComplete = !pin.isEmpty
        state.confirmPin = !pin.isEmpty ? ConfirmPin.State(previousPin: state.pin) : nil
        return .none
      case .continueTapped:
        return .none
      case .confirmPin:
        return .none
      }
    }.ifLet(\.confirmPin, action: /Action.confirmPin) {
      ConfirmPin()
    }
  }
}
