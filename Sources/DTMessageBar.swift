//
//  DTMessageBar.swift
//  DTMessageBar
//
//  Created by Dan Jiang on 2016/11/8.
//
//

import UIKit

public protocol DTMessageBarTheme {
  var successBorderColor: UIColor { get }
  var successBackgroundColor: UIColor { get }
  var successTextColor: UIColor { get }
  var infoBorderColor: UIColor { get }
  var infoBackgroundColor: UIColor { get }
  var infoTextColor: UIColor { get }
  var warningBorderColor: UIColor { get }
  var warningBackgroundColor: UIColor { get }
  var warningTextColor: UIColor { get }
  var errorBorderColor: UIColor { get }
  var errorBackgroundColor: UIColor { get }
  var errorTextColor: UIColor { get }
}

public extension DTMessageBarTheme {
  
  var successBorderColor: UIColor {
    return UIColor(red:0.84, green:0.91, blue:0.78, alpha:1.00)
  }

  var successBackgroundColor: UIColor {
    return UIColor(red:0.87, green:0.94, blue:0.85, alpha:1.00)
  }
  
  var successTextColor: UIColor {
    return UIColor(red:0.24, green:0.46, blue:0.24, alpha:1.00)
  }
  
  var infoBorderColor: UIColor {
    return UIColor(red:0.74, green:0.91, blue:0.95, alpha:1.00)
  }
  
  var infoBackgroundColor: UIColor {
    return UIColor(red:0.85, green:0.93, blue:0.97, alpha:1.00)
  }
  
  var infoTextColor: UIColor {
    return UIColor(red:0.19, green:0.44, blue:0.56, alpha:1.00)
  }
  
  var warningBorderColor: UIColor {
    return UIColor(red:0.98, green:0.92, blue:0.80, alpha:1.00)
  }
  
  var warningBackgroundColor: UIColor {
    return UIColor(red:0.99, green:0.97, blue:0.89, alpha:1.00)
  }
  
  var warningTextColor: UIColor {
    return UIColor(red:0.54, green:0.42, blue:0.23, alpha:1.00)
  }
  
  var errorBorderColor: UIColor {
    return UIColor(red:0.92, green:0.80, blue:0.82, alpha:1.00)
  }
  
  var errorBackgroundColor: UIColor {
    return UIColor(red:0.95, green:0.87, blue:0.87, alpha:1.00)
  }
  
  var errorTextColor: UIColor {
    return UIColor(red:0.66, green:0.27, blue:0.26, alpha:1.00)
  }
  
}

public class DTMessageBar: UIView {
  
  public enum IconSet {
    case standard
    case emoji
    case custom
  }
  
  public enum Style: String {
    case success
    case info
    case warning
    case error
  }
  
  public enum Position {
    case top
    case center
    case bottom
  }
  
  public struct DefaultTheme: DTMessageBarTheme {
    public init() {}
  }
  
  public static var iconSet: IconSet = .standard
  public static var theme: DTMessageBarTheme = DefaultTheme()
  public static var offset: CGFloat = 80

  private static let sharedView = DTMessageBar()
  
  private let typeImageView = UIImageView()
  private let messageLabel = UILabel()
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    layoutTypeImageView()
    layoutMessageLabel()
  }
  
  public class func success(message: String, position: Position = .top) {
    show(message: message, style: .success, position: position)
  }
  
  public class func info(message: String, position: Position = .top) {
    show(message: message, style: .info, position: position)
  }
  
  public class func warning(message: String, position: Position = .top) {
    show(message: message, style: .warning, position: position)
  }
  
  public class func error(message: String, position: Position = .top) {
    show(message: message, style: .error, position: position)
  }
  
  public static func imageWithName(_ name: String) -> UIImage? {
    let bundle = Bundle(for: DTMessageBar.self)
    let url = bundle.url(forResource: "DTMessageBar", withExtension: "bundle")!
    let imageBundle = Bundle(url: url)
    return UIImage(named: name, in: imageBundle, compatibleWith: nil)
  }

  private class func show(message: String, style: Style, position: Position) {
    if let _ = DTMessageBar.sharedView.superview {
      return
    }
    
    if let w = UIApplication.shared.delegate?.window, let window = w {
      DTMessageBar.sharedView.translatesAutoresizingMaskIntoConstraints = false
      
      window.addSubview(DTMessageBar.sharedView)
      
      let centerX = NSLayoutConstraint(item: DTMessageBar.sharedView, attribute: .centerX, relatedBy: .equal, toItem: window, attribute: .centerX, multiplier: 1, constant: 0)
      window.addConstraint(centerX)

      switch position {
      case .top:
        let top = NSLayoutConstraint(item: DTMessageBar.sharedView, attribute: .top, relatedBy: .equal, toItem: window, attribute: .top, multiplier: 1, constant: offset)
        window.addConstraint(top)
      case .center:
        let centerY = NSLayoutConstraint(item: DTMessageBar.sharedView, attribute: .centerY, relatedBy: .equal, toItem: window, attribute: .centerY, multiplier: 1, constant: 0)
        window.addConstraint(centerY)
      case .bottom:
        let bottom = NSLayoutConstraint(item: DTMessageBar.sharedView, attribute: .bottom, relatedBy: .equal, toItem: window, attribute: .bottom, multiplier: 1, constant: -offset)
        window.addConstraint(bottom)
      }
      
      DTMessageBar.sharedView.customize(message: message, style: style)
      
      DTMessageBar.sharedView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
      
      UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
        DTMessageBar.sharedView.transform = CGAffineTransform.identity
      }, completion: { _ in
        UIView.animate(withDuration: 0.25, delay: 2, options: .curveEaseIn, animations: {
          DTMessageBar.sharedView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }, completion: { _ in
          DTMessageBar.sharedView.removeFromSuperview()
        })
      })
    }
  }
  
  // MARK: - Private

  private func layoutTypeImageView() {
    addSubview(typeImageView)
    
    typeImageView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = NSLayoutConstraint(item: typeImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16)
    let leading = NSLayoutConstraint(item: typeImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16)
    let bottom = NSLayoutConstraint(item: typeImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -16)
    
    addConstraints([top, leading, bottom])
  }
  
  private func layoutMessageLabel() {
    messageLabel.font = UIFont.boldSystemFont(ofSize: 17)
    
    addSubview(messageLabel)
    
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let leading = NSLayoutConstraint(item: messageLabel, attribute: .leading, relatedBy: .equal, toItem: typeImageView, attribute: .trailing, multiplier: 1, constant: 16)
    let trailing = NSLayoutConstraint(item: messageLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -16)
    let centerY = NSLayoutConstraint(item: messageLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
    
    addConstraints([leading, trailing, centerY])
  }
  
  private func customize(message: String, style: Style) {
    layer.cornerRadius = 12
    layer.borderWidth = 2
    
    messageLabel.text = message
    
    var borderColor: UIColor
    var backgroundColor: UIColor
    var textColor: UIColor

    switch style {
    case .success:
      borderColor = DTMessageBar.theme.successBorderColor
      backgroundColor = DTMessageBar.theme.successBackgroundColor
      textColor = DTMessageBar.theme.successTextColor
    case .info:
      borderColor = DTMessageBar.theme.infoBorderColor
      backgroundColor = DTMessageBar.theme.infoBackgroundColor
      textColor = DTMessageBar.theme.infoTextColor
    case .warning:
      borderColor = DTMessageBar.theme.warningBorderColor
      backgroundColor = DTMessageBar.theme.warningBackgroundColor
      textColor = DTMessageBar.theme.warningTextColor
    case .error:
      borderColor = DTMessageBar.theme.errorBorderColor
      backgroundColor = DTMessageBar.theme.errorBackgroundColor
      textColor = DTMessageBar.theme.errorTextColor
    }
    
    var imageName: String
    switch DTMessageBar.iconSet {
    case .standard:
      imageName = style.rawValue
    case .emoji:
      imageName = "\(style.rawValue)_emoji"
    case .custom:
      imageName = "\(style.rawValue)_custom"
    }
    
    layer.borderColor = borderColor.cgColor
    self.backgroundColor = backgroundColor
    messageLabel.textColor = textColor
    
    if DTMessageBar.iconSet != .custom {
      typeImageView.image = DTMessageBar.imageWithName(imageName)
    } else {
      typeImageView.image = UIImage(named: imageName)
    }
  }
  
}
