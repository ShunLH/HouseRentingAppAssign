//
//  HouseDetailViewController.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/11/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController,UISearchBarDelegate {
	static let identifier = "HouseDetailViewController"
	@IBOutlet weak var lblDescription: UILabel!
	@IBOutlet weak var lblHouseTitle: UILabel!
	@IBOutlet weak var lblReviews: UILabel!
	@IBOutlet weak var lblFavourites: UILabel!
	@IBOutlet weak var lblBedrooms: UILabel!
	@IBOutlet weak var lblSqft: UILabel!
	@IBOutlet weak var lblLocation: UILabel!
	@IBOutlet weak var lblPrice: UILabel!
	@IBOutlet weak var btnLocation: UIButton!
	@IBOutlet weak var houseImageView: UIImageView!
	
	@IBOutlet weak var searchBar: UISearchBar!
	
	@IBOutlet weak var btnBookNow: UIButton!
	@IBOutlet weak var btnAddFavourite: UIButton!
	
	@IBOutlet weak var btnSeePhoto: UIButton!
	@IBOutlet weak var bottomView : UIView!
	var mHouse : HouseVO?
	override func viewDidLoad() {
        super.viewDidLoad()
		btnLocation.imageView?.contentMode = .scaleAspectFit
		btnLocation.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		btnLocation.layer.cornerRadius = 20
		btnLocation.setCornerRadiusShadow(cornerRadius: 22, shadowOffset: 2)
		btnSeePhoto.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		searchBar.delegate = self
		loadUI()
    }
	func loadUI(){
		if let url = mHouse?.houseImageUrl {
			houseImageView.sd_setImage(with: URL(string: url), completed: nil)
		}
		guard let data = mHouse else {return}
		
		if let price = data.price {
			lblPrice.text = "$ \(price)"
		}
		if let sqft = data.squareFeet {
			lblSqft.text = "$ \(sqft)"
		}
		lblHouseTitle.text = data.name
		lblLocation.text = data.address
		lblDescription.text = data.description
		
	}

	@IBAction func btnBack(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.endEditing(true)

	}
}
