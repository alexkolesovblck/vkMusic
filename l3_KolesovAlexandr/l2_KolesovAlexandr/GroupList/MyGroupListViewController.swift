//
//  AllGroupViewController.swift
//  l2_KolesovAlexandr
//
//  Created by Александр Колесов on 12.04.2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

class MyGroupViewController: UITableViewController {
  
  var me = Men(name: "Me")
  
  var meGroups: [Group] {
    return Database.share.groups.filter({$0.mens.contains(where: {$0 == me})})
  }
  
  override func viewDidLoad() {  
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    if let group = Database.share.groups.first {
      group.mens.append(me)
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    tableView.reloadData()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return meGroups.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
    cell.imageView?.image = meGroups[indexPath.row].image
    cell.textLabel?.text = meGroups[indexPath.row].name
    cell.detailTextLabel?.text = "You are already in the group."
    return cell
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .delete:
      if let meIndex = Database.share.groups[indexPath.row].mens.index(of: me) {
        Database.share.groups[indexPath.row].mens.remove(at: meIndex)
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
    case .insert:
      print("insert")
    case .none:
      print("none")
    }
  }
  
}
