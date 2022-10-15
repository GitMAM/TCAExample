//
//  TestPin.swift
//  TCAExampleTests
//
//  Created by Mohamed Ali on 15/10/2022.
//

import XCTest
@testable import TCAExample
import ComposableArchitecture

final class TestPin: XCTestCase {
  
  let store = TestStore(
    initialState: Pin.State(),
    reducer: Pin()
  )
  
  
  func testPinsDontMatch() {
    self.store.send(.pinChanged("hello pin")) {
      $0.pin = "hello pin"
      $0.isComplete = true
      $0.confirmPin = ConfirmPin.State(previousPin: "hello pin")
    }
  }
}
