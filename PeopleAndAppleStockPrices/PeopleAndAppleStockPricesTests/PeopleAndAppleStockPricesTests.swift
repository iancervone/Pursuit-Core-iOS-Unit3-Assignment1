//
//  PeopleAndAppleStockPricesTests.swift
//  PeopleAndAppleStockPricesTests
//
//  Created by Ian Cervone on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest

class PeopleAndAppleStockPricesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testGetContactsFromJSON() {
    let data = getContactsData()
  }
  
  private func getContactsData() -> Data {
    guard let pathToData = Bundle.main.path(forResource: "userinfo", ofType: "json") else {
      fatalError("error getting contacts")
    }
    let url = URL(fileURLWithPath: pathToData)
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch let jsonError{
      fatalError("more errors saying: \(jsonError)")
    }
//    return Data()
  }
  
  func testGetStocksFromJSON() {
    let data = getStocksData()
  }
  
  private func getStocksData() -> Data {
    guard let pathToData = Bundle.main.path(forResource: "applstockinfo", ofType: "json") else {
      fatalError("error getting stocks")
    }
    let url = URL(fileURLWithPath: pathToData)
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch let jsonError{
      fatalError("more errors saying: \(jsonError)")
    }
    //    return Data()
  }
}


