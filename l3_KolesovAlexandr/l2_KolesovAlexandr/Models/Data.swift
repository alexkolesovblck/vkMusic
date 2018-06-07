//
//  Data.swift
//  l2_KolesovAlexandr
//
//  Created by Александр Колесов on 13.04.2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

protocol Data {
  var name: String { get set }
  var image: UIImage? { get set }
}

class Men: Data, Equatable {
  var name: String
  var image: UIImage? = nil
  init(name: String, image: UIImage? = nil) {
    self.name = name
    self.image = image
  }
  static func == (lhs: Men, rhs: Men) -> Bool {
    return lhs.name == rhs.name
  }
}

class Group: Data {
  var name: String
  var image: UIImage?
  var mens: [Men] = []
  init(name: String, image: UIImage?) {
    self.name = name
    self.image = image
  }
}

class Database {
  static let share = Database()
  
  var groups: [Group] = []
  var mens: [Men] = []
  
  init() {
    [Group(name: "Dancers", image: #imageLiteral(resourceName: "dancing")),
      Group(name: "Actors", image: #imageLiteral(resourceName: "actor")),
      Group(name: "Policemans", image: #imageLiteral(resourceName: "policeman")),
      Group(name: "Pilots", image: #imageLiteral(resourceName: "pilot")),
      Group(name: "Athletes", image: #imageLiteral(resourceName: "athlete")),
      Group(name: "Adventurs", image: #imageLiteral(resourceName: "mountain")),
      Group(name: "Firefigthers", image: #imageLiteral(resourceName: "firefighter"))].forEach { group in
        groups.append(group)
    }
    [Men(name: "friend1", image: #imageLiteral(resourceName: "spy")),
      Men(name: "friend2", image: #imageLiteral(resourceName: "spy")),
      Men(name: "friend3", image: #imageLiteral(resourceName: "spy")),
      Men(name: "friend4", image: #imageLiteral(resourceName: "spy"))].forEach { men in
        mens.append(men)
    }
    
    for i in 0..<23 {
      groups[0].mens.append(Men(name: "friend\(i)"))
    }
    
    for i in 0..<27 {
      groups[1].mens.append(Men(name: "friend\(i)"))
    }
    
    for i in 0..<14 {
      groups[2].mens.append(Men(name: "friend\(i)"))
    }
    
    for i in 0..<23 {
      groups[3].mens.append(Men(name: "friend\(i)"))
    }
    
    for i in 0..<23 {
      groups[4].mens.append(Men(name: "friend\(i)"))
    }
    
    for i in 0..<23 {
      groups[5].mens.append(Men(name: "friend\(i)"))
    }
    
    for i in 0..<23 {
      groups[6].mens.append(Men(name: "friend\(i)"))
    }
    
  }
}
