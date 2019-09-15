//
//  HouseItemTableViewCell.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/11/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit
import SDWebImage
class HouseItemTableViewCell: UITableViewCell {

	@IBOutlet weak var btnLocation: UIButton!
	@IBOutlet weak var lblLocation: UILabel!
	
	@IBOutlet weak var cardView: CardView!
	@IBOutlet weak var lblPrice: UILabel!
	@IBOutlet weak var lblBedRooms: UILabel!
	@IBOutlet weak var lblSqft: UILabel!
	@IBOutlet weak var ivHouse : UIImageView!
	var delegate : HouseItemTableViewCellDelegate?

	var mHouse : HouseVO? {
		didSet {
			if let location = mHouse?.address {
				lblLocation.text = mHouse?.address
			}
			if let price = mHouse?.price {
				lblPrice.text = "$\(price)"
			}
			if let sqft = mHouse?.squareFeet {
				lblSqft.text = "\(sqft) sqft"

			}
			print("houseImageURL \(mHouse?.houseImageUrl)")
			if let imageURL = mHouse?.houseImageUrl {
				ivHouse?.sd_setImage(with: URL(string: imageURL), completed: nil)

			}
		}
	}
	override func awakeFromNib() {
        super.awakeFromNib()
		btnLocation.imageView?.contentMode = .scaleAspectFit
		btnLocation.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		btnLocation.setCornerRadiusShadow(cornerRadius: 22, shadowOffset: 2)
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickDetail))
		cardView.addGestureRecognizer(tapGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	@objc func onClickDetail(){
		delegate?.tapToDetail(data:mHouse)

	}
	
	
	
}
