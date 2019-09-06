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
    setImage()
    setName()
    }

  func setImage() {
    if let url = URL.init(string: contactDetails.picture.large){
      do{
        let contactData = try Data.init(contentsOf: url)
        if let photo = UIImage.init(data: contactData){
          contactImageView.image = photo
        }
      }catch{
        contactImageView.image = UIImage.init(named: "profileImage")
        //Personal profile image doesn't exist. Resort to using the default profile
      }
    }
  }
  
  
    func setName() {
       contactNameLabel.text = "\(contactDetails.name.first) \(contactDetails.name.last)"
    }
  
  //  func setDOB() {
  //
  //  }
  
  
}
  
//    if let url = URL.init(string: contactDetails.picture.large){
//      do{
//        let contactData = try Data.init(contentsOf: url)
//        if let photo = UIImage.init(data: contactData){
//          contactImageView.image = photo
//        }
//      }catch{
//        contactImageView.image = UIImage.init(named: "profileImage")
//        //Personal profile image doesn't exist. Resort to using the default profile
//      }
//    }
//    if let url = URL.init(string: contactDetails.picture.large) {
//      //    contactImageView.image = URL.init(string: url)
//      do {
//        let contactData = try Data.init(contentsOf: url)
//        if let picture = UIImage.init(data: contactData) {
//          contactImageView.image = picture
//        }
//        catch{
//          contactImageView.image = UIImage.init(named: "profileImage")
//        }
////    DispatchQueue.global(qos: .userInitiated).async {
//      let image = UIImage(named: self.contactDetails.picture.large)
//      DispatchQueue.main.async {
//        self.contactImageView.image = image
////      }
//    if let url = URL.init(string: contactDetails.picture.large) {
//      //    contactImageView.image = URL.init(string: url)
//      do {
//        let contactData = try Data.init(contentsOf: url)
//        if let picture = UIImage.init(data: contactData) {
//          contactImageView.image = picture
//        } catch{
//          self.contactImageView.image = UIImage.init(named: "profileImage")
//        }
//      }
//      ////    DispatchQueue.global(qos: .userInitiated).async {
//      //      let image = UIImage(named: self.contactDetails.picture.large)
//      //      DispatchQueue.main.async {
//      //        self.contactImageView.image = image
//      ////      }
//    }

  
  


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
  
//}
