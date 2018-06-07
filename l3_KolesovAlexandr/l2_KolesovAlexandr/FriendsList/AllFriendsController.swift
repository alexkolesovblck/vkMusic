//
//  AllFriendsController.swift
//  l2_KolesovAlexandr
//
//  Created by Александр Колесов on 10.04.2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

class AllFriendsController: UITableViewController {
  
  public var friendsArr: [Men] = []
  
  @IBOutlet weak var friendsTable: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    friendsTable.delegate = self
    friendsTable.backgroundColor = UIColor.lightGray
    friendsArr = [
      Men(name: "Jack Sparrow", image: #imageLiteral(resourceName: "JackSparrow")),
      Men(name: "Angelina Jolie", image: #imageLiteral(resourceName: "angelinaJolie")),
      Men(name: "Matt Damon", image: #imageLiteral(resourceName: "mattDamon")),
      Men(name: "Mark Wahlberg", image: #imageLiteral(resourceName: "markWahlberg"))
    ]
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = friendsTable.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! AllFriendsCell
    cell.imageView?.image = friendsArr[indexPath.row].image
    cell.textLabel?.text = friendsArr[indexPath.row].name
    cell.backgroundColor = UIColor.lightGray
    cell.detailTextLabel?.text = nil
    cell.layoutSubviews()
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return friendsArr.count
  }
}

