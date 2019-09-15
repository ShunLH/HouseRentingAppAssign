//
//  Extensions.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/11/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation

import UIKit

extension UITableView {
	func registerForCell(StrID : String) {
		register(UINib(nibName: StrID, bundle: nil), forCellReuseIdentifier: StrID)
	}
}

extension UICollectionView {
	func registerForCell(StrID : String){
		register(UINib(nibName: StrID, bundle: nil), forCellWithReuseIdentifier: StrID)
	}
}
extension UIButton {
	func setCornerRadiusShadow(cornerRadius : CGFloat , shadowOffset : CGFloat){
		layer.shadowColor = UIColor.lightGray.cgColor
		layer.shadowOffset = CGSize(width: 0.0, height: shadowOffset)
		layer.shadowOpacity = 0.5
		layer.shadowRadius = 0.0
		layer.masksToBounds = false
		layer.cornerRadius = cornerRadius
	}
}

extension UIView {
	func setShadow(shadowOffset : CGFloat){
		layer.shadowColor = UIColor.lightGray.cgColor
		layer.shadowOffset = CGSize(width: 0.0, height: shadowOffset)
		layer.shadowOpacity = 0.5
		layer.shadowRadius = 0.0
		layer.masksToBounds = false
	}
}
