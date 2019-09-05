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
  
  
  //SEARCH BAR CODE vvv
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    self.searchString = searchBar.text
  }
  
  var searchString: String? = nil {
    didSet {
      self.contactsTableView.reloadData()
    }
  }
  
  var searchResults:[Results] {
      guard let searchString = searchString else {
        return contactData
      }
        return contactData.filter{$0.name.first.lowercased().contains(searchString.lowercased())}
      }
  //SEARCH BAR CODE ^^^

  
  override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsSearchBar.delegate = self
    }
  
  
  private func loadData() {
    guard let pathToJSONFile = Bundle.main.path(forResource: "userinfo", ofType: "json") else {
      fatalError("couldn't find json file")
    }
    print(pathToJSONFile)
    let url = URL(fileURLWithPath: pathToJSONFile)
    do {
      let data = try Data(contentsOf: url)
      let contactsFromJSON = try Contact.getContacts(from: data)
      contactData = contactsFromJSON
    } catch {
      fatalError("Couldn't get contacts from JSON: \(error)")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let segueIdentifier = segue.identifier else { fatalError("No identifier on segue") }
    switch segueIdentifier {
    case "contactsDetailSegue":
      guard let destinationVC = segue.destination as? ContactsDetailViewController else {
        fatalError("Unexpected segue VC")
      }
      guard let selectedIndexPath = contactsTableView.indexPathForSelectedRow else {
        fatalError("No row was selected")
      }
      destinationVC.contactDetails = contactData[selectedIndexPath.row]
    default:
      fatalError("Unexpected segue identifier")
    }
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
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    self.searchString = searchText
  }
}
  
  
//  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//    let request : NSFetchRequest<Results> = Results.fetchRequest()
////    guard let searchBarText = searchBar.text else { return }
////    let contactRequest = Results(name: searchBarText)
//  }
//}


