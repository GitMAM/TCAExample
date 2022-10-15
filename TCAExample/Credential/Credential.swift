//
//  Credential.swift
//  TCAExample
//
//  Created by Mohamed Ali on 13/10/2022.
//

import ComposableArchitecture

public struct Credential: ReducerProtocol {
  public struct State: Equatable {
    var email = ""
    var password = ""
    var isComplete = false
    var personalInfo: PersonalInfo.State? = nil
    
    init(email: String = "", password: String = "", isComplete: Bool = false, personalInfo: PersonalInfo.State? = nil) {
      self.email = email
      self.password = password
      self.isComplete = isComplete
      self.personalInfo = personalInfo
    }
  }
  
  public enum Action: Equatable {
    case continueTapped
    case emailFieldChanged(String)
    case passwordFieldChanged(String)
    case personalInfo(PersonalInfo.Action)
  }
  
  public init() {}
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      let validated = !state.email.isEmpty && !state.password.isEmpty
      switch action {
      case let .emailFieldChanged(email):
        state.email = email
        state.isComplete = validated
        state.personalInfo = validated ? PersonalInfo.State() : nil
        return .none
        
      case let .passwordFieldChanged(password):
        state.password = password
        state.isComplete = validated
        state.personalInfo = validated ? PersonalInfo.State() : nil
        return .none
        
      case .continueTapped:
        state.personalInfo = PersonalInfo.State()
        return .none
      case .personalInfo:
        return .none
      }
      
    }.ifLet(\.personalInfo, action: /Action.personalInfo) {
      PersonalInfo()
    }
  }
}
