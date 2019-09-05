//
//  ContactsDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ian Cervone on 9/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController {

  @IBOutlet weak var contactImageView: UIImageView!
  @IBOutlet weak var contactNameLabel: UILabel!
  @IBOutlet weak var contactDOBlabel: UILabel!
  @IBOutlet weak var contactStreetLabel: UILabel!
  @IBOutlet weak var contactCityStateLabel: UILabel!
  
  var contactDetails: Results!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  
  func setImage() {
    contactImageView.image = UIImage(named: contactDetails.picture.large)
  }
//
//  
//  func setName() {
//    
//  }
//  
//  func setDOB() {
//    
//  }
//  
//  
//  func setAddress(){
//    
//  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
