//
//  TestPersonalInfo.swift
//  TCAExampleTests
//
//  Created by Mohamed Ali on 15/10/2022.
//

import XCTest
@testable import TCAExample
import ComposableArchitecture


final class TestPersonalInfo: XCTestCase {
  
  let store = TestStore(
    initialState: PersonalInfo.State(),
    reducer: PersonalInfo()
  )
  
  func testFlow_From_Credential_Intergation() {
    self.store.send(.firstNameChanged("name")) {
      $0.isComplete = false
      $0.firstName = "name"
      $0.pin = nil
    }
    
    self.store.send(.lastNameChanged("lastname")) {
      $0.isComplete = false
      $0.lastName = "lastname"
      $0.pin = nil
    }
  }
}
