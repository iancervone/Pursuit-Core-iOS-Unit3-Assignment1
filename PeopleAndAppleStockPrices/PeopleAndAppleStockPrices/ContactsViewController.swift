//
//  ContactsViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ian Cervone on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

  var contactData = [Results](){
    didSet {
      contactsTableView.reloadData()
    }
  }
  
  @IBOutlet weak var contactsSearchBar: UISearchBar!
  
  
  @IBOutlet weak var contactsTableView: UITableView!
  
  
  
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
  
  private func loadData() {
    guard let pathToJSONFile = Bundle.main.path(forResource: "userinfo", ofType: "json") else {
      fatalError("couldn't find json file")
    }
    print(pathToJSONFile)
    let url = URL(fileURLWithPath: pathToJSONFile)
    do {
      let data = try Data(contentsOf: url)
      //decode data to create episodes
      let contactsFromJSON = try Contact.getContacts(from: data)
      contactData = contactsFromJSON
    } catch {
      fatalError("Couldn't get contacts from JSON: \(error)")
    }
    //episodes = whatever we decode from the json file
  }
  
  
  
}


extension ContactsViewController: UITableViewDelegate {
  
}


extension ContactsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contactData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell")
    cell?.textLabel?.text = "\(contactData[indexPath.row].name.first) \(contactData[indexPath.row].name.last)"
    cell?.detailTextLabel?.text = "\(contactData[indexPath.row].location.city), \(contactData[indexPath.row].location.state)"
    return cell!
  }
  
  
}


extension ContactsViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let searchBarText = searchBar.text else { return }
//    let contactRequest = Results(name: searchBarText)
  }
}
