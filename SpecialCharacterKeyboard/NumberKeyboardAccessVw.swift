//
//  AlphabetsWithNumberVw.swift
//
//  Created by Grappus Air on 27/10/18.
//  Copyright © 2018 Veridian Dynamics. All rights reserved.
//

import UIKit

class NumberKeyboardAccessVw: UIView {
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var clearButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!
  
  var keyboardOptions = ["0","1","2","3","4","5","6","7","8","9"]
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  var enableInputClicksWhenVisible: Bool { return true }
  
  func setupUI() {
    Bundle.main.loadNibNamed("NumberKeyboardAccessVw", owner: self, options: nil)
    contentView.frame = self.bounds
    addSubview(contentView)
    setupCollectionView()
  }
  
  func setupCollectionView(){
    collectionView.dataSource = self
    collectionView.register(UINib.init(nibName: "NumberKeyboardCell", bundle: nil), forCellWithReuseIdentifier: "NumberKeyboardCell")
    collectionView.allowsMultipleSelection = false
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
  }
}

extension NumberKeyboardAccessVw: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return keyboardOptions.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberKeyboardCell", for: indexPath) as! NumberKeyboardCell
    cell.textLabel.text = keyboardOptions[indexPath.row]
    return cell
  }
}
