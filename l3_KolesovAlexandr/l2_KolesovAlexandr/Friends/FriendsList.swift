//
//  FriendsList.swift
//  l2_KolesovAlexandr
//
//  Created by Александр Колесов on 10.04.2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

class FriendsList: ViewController {
//  var friendsArray = [
//  "Angelina Jolie", UIImageView(image: #imageLiteral(resourceName: "angelinaJolie")),
//  "Jack Sparrow", UIImageView(image: #imageLiteral(resourceName: "JackSparrow")),
//  "Matt Damon", UIImageView(image: #imageLiteral(resourceName: "mattDamon")),
//  "Mark Wahlberg", UIImageView(image: #imageLiteral(resourceName: "markWahlberg"))
//    ] as [Any]
  var friendsArray: [FriendsArray] = [
  FriendsArray(name: "Angelina Jolie", image: #imageLiteral(resourceName: "angelinaJolie")),
  FriendsArray(name: "Jack Sparrow", image: #imageLiteral(resourceName: "JackSparrow")),
  FriendsArray(name: "Matt Damon", image: #imageLiteral(resourceName: "mattDamon")),
  FriendsArray(name: "Mark Wahlberg", image: #imageLiteral(resourceName: "markWahlberg"))]
}


private class FriendsArray {
  var name: String
  var image: UIImage
  
  init(name: String, image: UIImage) {
    self.name = name
    self.image = image
  }
}
