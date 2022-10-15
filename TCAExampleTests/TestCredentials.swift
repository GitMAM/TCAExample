//
//  TestCredentials.swift
//  TCAExampleTests
//
//  Created by Mohamed Ali on 15/10/2022.
//

import XCTest
@testable import TCAExample
import ComposableArchitecture


final class TestCredentials: XCTestCase {
  
  let store = TestStore(
    initialState: Credential.State(),
    reducer: Credential()
  )
  
  func testFlow_From_Credential_Intergation() {
    self.store.send(.emailFieldChanged("email")) {
      $0.isComplete = false
      $0.email = "email"
      $0.personalInfo = nil
    }
    
    self.store.send(.passwordFieldChanged("password")) {
      $0.isComplete = false
      $0.email = "email"
      $0.password = "password"
    }
  }
}
