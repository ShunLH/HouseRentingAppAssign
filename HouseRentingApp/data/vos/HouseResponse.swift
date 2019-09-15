//
//  Result.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/12/19.
//  Copyright © 2019 SLH. All rights reserved.
//


import Foundation
struct HouseResponse : Codable {
	var code : Int?
	var message : String?
	var data : [HouseVO]?
	
	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case data = "data"
	}

	
}
