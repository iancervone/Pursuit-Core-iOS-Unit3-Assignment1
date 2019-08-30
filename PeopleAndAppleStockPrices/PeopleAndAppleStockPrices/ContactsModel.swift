//
//  ContactsModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ian Cervone on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Contact: Codable {
  let name: [Name]
  let location: [Location]
  let picture: [Picture]
  let dob: String
}

struct Name: Codable {
  let title: String
  let first: String
  let last: String
}

struct Location: Codable {
  let street: String
  let city: String
  let state: String
}

struct Picture: Codable {
  let large: String
}
