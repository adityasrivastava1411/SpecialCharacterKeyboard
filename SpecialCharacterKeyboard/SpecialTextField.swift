//
//  SpecialTextField.swift
//
//  Created by Grappus Air on 27/10/18.
//  Copyright © 2018 Veridian Dynamics. All rights reserved.
//

import UIKit

open class SpecialTextField: UITextField {
  var specialCharacters : [String] = [] {
    willSet {
      accessoryVw.keyboardOptions = newValue
      accessoryVw.collectionView.reloadData()
    }
  }
  var accessoryVw = NumberKeyboardAccessVw.init(frame: CGRect.init(x: 0, y: 0, width:
    UIScreen.main.bounds.width, height: 45))
  
  //MARK: init
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupTextView()
  }
  
  func setupTextView() {
    self.backgroundColor = UIColor.white
    self.inputAccessoryView = accessoryVw
    accessoryVw.collectionView.delegate = self
  }
}

//MARK: TextView and CollectionView Delegates
extension SpecialTextField: UICollectionViewDelegateFlowLayout {
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as? NumberKeyboardCell
    insertText(cell?.textLabel.text ?? "")
    UIDevice.current.playInputClick()
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.size.width/10 , height: collectionView.bounds.height)
  }
}
