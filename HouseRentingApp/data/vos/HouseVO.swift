//
//  HomeVO.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/11/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation
struct HouseVO : Codable {
	let id : Int?
	let houseImageUrl : String?
	let name : String?
	let description : String?
	let price : Int?
	let address : String?
	let squareFeet : Int?
	let latitude : Double?
	let longitude : Double?
	
	enum CodingKeys: String, CodingKey {
		
		case id = "id"
		case houseImageUrl = "house_image_url"
		case name = "name"
		case description = "description"
		case price = "price"
		case address = "address"
		case squareFeet = "square_feet"
		case latitude = "latitude"
		case longitude = "longitude"
	}
}
