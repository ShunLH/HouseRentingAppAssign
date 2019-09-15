//
//  House.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/12/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation
class HouseModel {
	
	class func shared() -> HouseModel {
		return sharedHouseModel
	}
	private static var sharedHouseModel : HouseModel = {
		let houseModel = HouseModel()
		return houseModel
	}()
	
	var houseResponse : HouseResponse = HouseResponse()
	

	func apiGetMovieList(success : @escaping () -> Void , failure : @escaping(String) -> Void) {
		NetworkClient.shared().getData(success: { (data) in
			guard let data = data as? Data else {return}
			do {
				let decoder = JSONDecoder()
//				decoder.keyDecodingStrategy = .convertFromSnakeCase
				self.houseResponse = try decoder.decode(HouseResponse.self, from: data)
				success()
				
			}catch let jsonErr {
				failure(jsonErr.localizedDescription)
			}
		}) { (err) in
			failure(err)
		}
	}
}
