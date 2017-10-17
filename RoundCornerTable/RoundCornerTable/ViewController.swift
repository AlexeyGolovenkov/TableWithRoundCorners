//
//  ViewController.swift
//  RoundCornerTable
//
//  Created by Alex Golovenkov on 18/10/2017.
//  Copyright © 2017 Alex Golovenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

	@IBOutlet weak var tableViewSubstrate: UIView!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		// Do any additional setup after loading the view, typically from a nib.
		self.setTableViewBackground()
	}

	private func setTableViewBackground() {
		let backgroundView = self.tableViewSubstrate!
		let maskPath: UIBezierPath = UIBezierPath(roundedRect: backgroundView.bounds, byRoundingCorners: ([.topLeft, .topRight]), cornerRadii: CGSize(width:20, height:20))
		let maskLayer: CAShapeLayer = CAShapeLayer()
		maskLayer.path = maskPath.cgPath
		backgroundView.layer.mask = maskLayer
	}

	// MARK: UITableViewDataSource methods
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 100;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		cell.textLabel?.text = "\(indexPath.row)"
		return cell
	}
}

