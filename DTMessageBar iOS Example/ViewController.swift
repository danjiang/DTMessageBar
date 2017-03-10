//
//  ViewController.swift
//  DTMessageBar iOS Example
//
//  Created by Dan Jiang on 2016/11/8.
//
//

import UIKit
import DTMessageBar

class ViewController: UIViewController {

  @IBOutlet weak var iconSetSegmentedControl: UISegmentedControl!
  @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
  @IBOutlet weak var positionSegmentedControl: UISegmentedControl!
  @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
  @IBOutlet weak var messageTextField: UITextField!
  
  @IBAction func chooseIconSet(_ sender: Any) {
    switch iconSetSegmentedControl.selectedSegmentIndex {
    case 1:
      DTMessageBar.iconSet = .emoji
    case 2:
      DTMessageBar.iconSet = .custom
    default:
      DTMessageBar.iconSet = .standard
    }
  }
  
  @IBAction func chooseTheme(_ sender: Any) {
    switch themeSegmentedControl.selectedSegmentIndex {
    case 1:
      DTMessageBar.theme = DarkTheme()
    default:
      DTMessageBar.theme = DTMessageBar.DefaultTheme()
    }
  }
  
  @IBAction func show(_ sender: Any) {
    guard let message = messageTextField.text, !message.isEmpty else {
      return
    }
    
    let position: DTMessageBar.Position
    switch positionSegmentedControl.selectedSegmentIndex {
    case 1:
      position = .center
    case 2:
      position = .bottom
    default:
      position = .top
    }
    
    switch typeSegmentedControl.selectedSegmentIndex {
    case 1:
      DTMessageBar.info(message: message, position: position)
    case 2:
      DTMessageBar.warning(message: message, position: position)
    case 3:
      DTMessageBar.error(message: message, position: position)
    default:
      DTMessageBar.success(message: message, position: position)
    }
  }
  
  @IBAction func hideKeyboard(_ sender: Any) {
    view.endEditing(true)
  }
  
}

struct DarkTheme: DTMessageBarTheme {
  
  var successBorderColor: UIColor {
    return UIColor.black
  }
  
  var successBackgroundColor: UIColor {
    return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
  }
  
  var successTextColor: UIColor {
    return UIColor.white
  }
  
  var infoBorderColor: UIColor {
    return UIColor.black
  }
  
  var infoBackgroundColor: UIColor {
    return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
  }
  
  var infoTextColor: UIColor {
    return UIColor.white
  }
  
  var warningBorderColor: UIColor {
    return UIColor.black
  }
  
  var warningBackgroundColor: UIColor {
    return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
  }
  
  var warningTextColor: UIColor {
    return UIColor.white
  }
  
  var errorBorderColor: UIColor {
    return UIColor.black
  }
  
  var errorBackgroundColor: UIColor {
    return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
  }
  
  var errorTextColor: UIColor {
    return UIColor.white
  }

}
