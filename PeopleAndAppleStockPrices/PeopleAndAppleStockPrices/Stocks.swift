//
//  StocksModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ian Cervone on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Stocks : Codable {
  let date: String
  let open: Double
  let close: Double
  let high: Double
  let low: Double
  
  static func getStocks(from data: Data) throws -> Stocks {
    do {
      let stock = try JSONDecoder().decode(Stocks.self, from: data)
      return stock
    } catch {
      throw JSONError.decodingContactsError(error)
    }
  }
}
