//
//  BaseViewController.swift
//  HouseRentingApp
//
//  Created by AcePlus Admin on 9/13/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
extension BaseViewController : NVActivityIndicatorViewable {
	func showIndicatior(_ message : String) {
		startAnimating(CGSize(width: 40, height: 40),message: message,type: NVActivityIndicatorType.ballScaleRipple, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
	}
	func hideIndicator() {
		stopAnimating()
	}
}
