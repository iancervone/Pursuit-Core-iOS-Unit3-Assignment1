//
//  ContactsModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ian Cervone on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum JSONError: Error {
  case decodingContactsError(Error)
}

//struct AllContacts: Codable {
//  let contacts = [Contact]
//
//static func getContacts(from data: Data) throws -> [Contact] {
//  do {
//    let contactInfo = try JSONDecoder().decode(AllContacts.self, from: data)
//    return contactInfo.contacts
//  } catch {
//    throw JSONError.decodingContactsError(error)
//    }
//  }
//}


struct Contact: Codable {
  let results: [Results]
  
  static func getContacts(from data: Data) throws -> Contact {
    do {
      let contacts = try JSONDecoder().decode(Contact.self, from: data)
      return contacts
    } catch {
      throw JSONError.decodingContactsError(error)
    }
  }
}

struct Results: Codable {
  let name: Name
  let location: Location
  let picture: Picture
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





