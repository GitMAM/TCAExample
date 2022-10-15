//
//  PersonalInfo.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import ComposableArchitecture

public struct PersonalInfo: ReducerProtocol {
  public struct State: Equatable {
    var firstName = ""
    var lastName = ""
    var phoneNumber = ""
    var isComplete = false
    var pin: Pin.State? = nil
  }
  
  public enum Action: Equatable {
    case continueTapped
    case firstNameChanged(String)
    case lastNameChanged(String)
    case phoneNumberChanged(String)
    case pin(Pin.Action)
  }
  
  public init() {}
  
  @Preference(\.username) var username
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      let isValid = !state.firstName.isEmpty &&  !state.lastName.isEmpty && !state.phoneNumber.isEmpty
      switch action {
      case let .firstNameChanged(firstName):
        state.firstName = firstName
        state.isComplete = isValid
        state.pin = isValid ? Pin.State() : nil
        if isValid {
          username = state.firstName + " " + state.lastName
        }
        return .none
        
      case let .lastNameChanged(lastName):
        state.lastName = lastName
        state.isComplete = isValid
        state.pin = isValid ? Pin.State() : nil
        
        if isValid {
          username = state.firstName + " " + state.lastName
        }
        
      case let .phoneNumberChanged(phoneNumber):
        state.phoneNumber = phoneNumber
        state.isComplete = isValid
        state.pin = isValid ? Pin.State() : nil
        
        if isValid {
          username = state.firstName + " " + state.lastName
        }
        
      case .continueTapped:
        state.pin = Pin.State()
        return .none
      case .pin:
        return .none
      }
      
      return .none
    }.ifLet(\.pin, action: /Action.pin) {
      Pin()
    }
  }
}
