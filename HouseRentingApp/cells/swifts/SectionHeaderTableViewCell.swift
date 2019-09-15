//
//  SectionHeaderTableViewCell.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/11/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {

	@IBOutlet weak var collectionViewHeader: UICollectionView!
	var textList : [String] = ["Top Collection","Near Me","Low to High Price","Near Downtown"]
	override func awakeFromNib() {
        super.awakeFromNib()
		collectionViewHeader.dataSource = self
		configureCollectionView()
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
	
	func configureCollectionView() {
		collectionViewHeader.delegate = self
		collectionViewHeader.registerForCell(StrID: String(describing: HeaderCollectionViewCell.self))
		collectionViewHeader.allowsMultipleSelection = false
		collectionViewHeader.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .right)
	}
    
}
extension SectionHeaderTableViewCell : UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return textList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HeaderCollectionViewCell.self), for: indexPath) as! HeaderCollectionViewCell
		cell.lblText.text = textList[indexPath.item]
		return cell
	}
}

extension SectionHeaderTableViewCell : UICollectionViewDelegate {
	
	

}
extension SectionHeaderTableViewCell : UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let label = UILabel(frame: CGRect.zero)
		label.text = textList[indexPath.item]
		label.font = UIFont(name: "Arial Hebrew Bold", size: 16)
		label.sizeToFit()
		return CGSize(width: label.frame.width + 10, height: 36)
	}
}
