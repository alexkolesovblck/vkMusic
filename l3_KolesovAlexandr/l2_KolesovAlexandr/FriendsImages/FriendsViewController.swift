//
//  FriendsViewController.swift
//  l2_KolesovAlexandr
//
//  Created by Александр Колесов on 12.04.2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

class FriendsViewController: UICollectionViewController {
  var friendsImage: [Men] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    friendsImage = [
      Men(name: "Jack Sparrow", image: #imageLiteral(resourceName: "JackSparrow")),
      Men(name: "Angelina Jolie", image: #imageLiteral(resourceName: "angelinaJolie")),
      Men(name: "Matt Damon", image: #imageLiteral(resourceName: "mattDamon")),
      Men(name: "Mark Wahlberg", image: #imageLiteral(resourceName: "markWahlberg"))
    ]
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return friendsImage.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
    
    cell.friendsNameLabel.text = friendsImage[indexPath.row].name
    cell.friendsPictImage.image = friendsImage[indexPath.row].image
    return cell
  }
}
