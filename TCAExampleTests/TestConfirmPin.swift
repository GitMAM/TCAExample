//
//  TCAExampleTests.swift
//  TCAExampleTests
//
//  Created by Mohamed Ali on 12/10/2022.
//

import XCTest
@testable import TCAExample
import ComposableArchitecture


final class TestConfirmPin: XCTestCase {
  
  let store = TestStore(
    initialState: ConfirmPin.State(previousPin: "My pin"),
    reducer: ConfirmPin()
  )
  
  
  func testPinsDontMatch() {
    self.store.send(.pinChanged("hello pin")) {
      $0.pin = "hello pin"
      $0.isComplete = false
    }
  }
  
  func testPinsMatch() {
    self.store.send(.pinChanged("My pin")) {
      $0.pin = "My pin"
      $0.isComplete = true
    }
  }
}
