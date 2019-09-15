//
//  ViewController.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/11/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,UISearchBarDelegate {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var TableViewHouseList: UITableView!
	var refreshControl = UIRefreshControl()
	override func viewDidLoad() {
		super.viewDidLoad()
		configureTableView()
		getHouseList()
		searchBar.delegate = self
		searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		searchBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		searchBar.searchBarStyle = .minimal
//		searchBar.barStyle = .blackTranslucent
		searchBar.placeholder = "Find your location here"
		searchBar.returnKeyType = .search
		
	}
	func configureTableView(){
		TableViewHouseList.delegate = self
		TableViewHouseList.dataSource = self
		TableViewHouseList.registerForCell(StrID: String(describing: SectionHeaderTableViewCell.self))
		TableViewHouseList.registerForCell(StrID: String(describing: HouseItemTableViewCell.self))
		TableViewHouseList.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
		refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
		TableViewHouseList.addSubview(refreshControl)
	}
	@objc func onRefresh(){
		getHouseList()
	}

	func getHouseList(){
		self.showIndicatior("Loading...")
		HouseModel.shared().apiGetMovieList(success: {
			self.hideIndicator()
			print("success")
			self.refreshControl.endRefreshing()
			self.TableViewHouseList.reloadData()
		}) { (err) in
			self.refreshControl.endRefreshing()
			self.hideIndicator()
			print("failure")
		}
	}
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.endEditing(true)
	}
}
extension HomeViewController : UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let response = HouseModel.shared().houseResponse.data {
			return response.count
		}else {
			return 4

		}
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HouseItemTableViewCell.self), for: indexPath) as? HouseItemTableViewCell {
			cell.mHouse = HouseModel.shared().houseResponse.data?[indexPath.row]
			cell.delegate = self
		return cell
		} else{
			return UITableViewCell()
		}
	}
	
	
}
extension HomeViewController : UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionHeaderTableViewCell.self)) as? SectionHeaderTableViewCell
		return cell
	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionHeaderTableViewCell.self)) as? SectionHeaderTableViewCell
		return cell?.frame.height ?? 0
	}
	
}
extension HomeViewController : HouseItemTableViewCellDelegate {
	func tapToDetail(data: HouseVO?) {
		let storyboard = UIStoryboard(name: SharedConstants.Storyboards.SB_MAIN, bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: HouseDetailViewController.identifier) as! HouseDetailViewController
		vc.mHouse = data
		self.present(vc, animated: true, completion: nil)
	}
	
	
}
