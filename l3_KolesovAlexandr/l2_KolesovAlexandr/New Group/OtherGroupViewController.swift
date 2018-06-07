//
//  OtherGroupViewController.swift
//  l2_KolesovAlexandr
//
//  Created by Александр Колесов on 12.04.2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit


public class OtherGroupViewController: UITableViewController {
  
  @IBOutlet weak var otherGroup: UITableView!
  
  var otherGroupListArray: [Group] = Database.share.groups
  
  override public func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override public func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return otherGroupListArray.count
  }
  
  public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let me = Men(name: "Me")
    if !Database.share.groups[indexPath.row].mens.contains(me) {
      Database.share.groups[indexPath.row].mens.append(me)
    } else {
      showInvaidGroupError()
    }
    tableView.reloadData()
  }
  
  func showInvaidGroupError(){
    let alter = UIAlertController(title: "Внимание!", message: "Вы уже состоите в данной группе", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alter.addAction(action)
    present(alter, animated: true, completion: nil)
  }
  
  override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "OtherGroupCell", for: indexPath)
    cell.imageView?.image = otherGroupListArray[indexPath.row].image
    cell.textLabel?.text = otherGroupListArray[indexPath.row].name
    cell.detailTextLabel?.text = "\(otherGroupListArray[indexPath.row].mens.count)"
    return cell
  }
    
}
