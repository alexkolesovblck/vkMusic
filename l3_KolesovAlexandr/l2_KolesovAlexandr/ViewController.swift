//
//  ViewController.swift
//  l2_KolesovAlexandr
//
//  Created by Александр Колесов on 09.04.2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate{
  
  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var passwordField: UITextField! = nil
  @IBOutlet weak var firstTitle: UINavigationItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameField.delegate = self
    passwordField.delegate = self
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  @objc func keyboardWillShow(notification:NSNotification){
    var userInfo = notification.userInfo!
    var keyboardFrame: CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    keyboardFrame = self.view.convert(keyboardFrame, from: nil)
    
    var contentInset:UIEdgeInsets = self.scrollView.contentInset
    contentInset.bottom = keyboardFrame.size.height
    self.scrollView.contentInset = contentInset
  }
  
  @objc func keyboardWillHide(notification:NSNotification){
    
    let contentInset: UIEdgeInsets = UIEdgeInsets.zero
    self.scrollView.contentInset = contentInset
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.viewIfLoaded?.endEditing(true)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    nameField.resignFirstResponder()
    passwordField.resignFirstResponder()
    return true;
  }
  
  @IBAction func buttonClick(_ sender: Any) {
  }
  
  @IBAction func unwindFromFirstTable(_ sender: UIStoryboardSegue){
    nameField.text = nil
    passwordField.text = nil
  }
  
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    let checkResult = checkUserData()
    
    if !checkResult {
      showLoginError()
    }
    return checkResult
  }
  
  func checkUserData() -> Bool {
    if nameField.text == "1" && passwordField.text == "1" {
      return true
    } else {
      return false
    }
  }
  func showLoginError(){
    let alter = UIAlertController(title: "Ошибка", message: "Введены неправильные данные пользователя", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alter.addAction(action)
    present(alter, animated: true, completion: nil)
  }
}





