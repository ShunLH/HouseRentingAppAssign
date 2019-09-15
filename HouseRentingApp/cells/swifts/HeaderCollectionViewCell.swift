//
//  HeaderCollectionViewCell.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/11/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var lblText : UILabel!
	
	@IBOutlet weak var pointerView: UIView!
	override func awakeFromNib() {
        super.awakeFromNib()
		pointerView.isHidden = true
		lblText.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)


    }
	override var isSelected: Bool{
		didSet{
			if self.isSelected {
				pointerView.isHidden = false
				lblText.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
			}else{
				pointerView.isHidden = true
				lblText.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
			}
		}
	}

}
