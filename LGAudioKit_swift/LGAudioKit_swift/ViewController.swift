//
//  ViewController.swift
//  LGAudioKit_swift
//
//  Created by ligang on 2018/1/29.
//  Copyright © 2018年 LG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.view.backgroundColor = UIColor.brown;
		self.initTableView()
		self.initButton()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@objc func initTableView() {
		let screenW = self.view.bounds.width
		let screemH = self.view.bounds.height
		let tableView = UITableView.init(frame: CGRect.init(x: 10, y: 20, width: screenW - 20, height: screemH - 70), style: .plain)
		tableView.backgroundColor = .yellow
		tableView.delegate = self
		tableView.dataSource = self
		self.view.addSubview(tableView)
	}
	
	@objc func initButton() {
		let screenW = self.view.bounds.width
		let screemH = self.view.bounds.height
		let button = UIButton(type: .custom)
		button.frame = CGRect(x: 10, y: screemH - 40, width: screenW - 20, height: 30)
		button.setTitleColor(.blue, for: .selected)
		button.setTitle("w3rq4q", for: .normal)
		button.addTarget(self, action: #selector(btnTouched) , for: .touchUpInside)
		button.layer.borderColor = UIColor.black.cgColor
		button.layer.borderWidth = 1
		button.layer.cornerRadius = 4
		button.layer.masksToBounds = true
		self.view.addSubview(button)
	}
	
	@objc func btnTouched() {
	}
}

extension ViewController: UITableViewDelegate {
	
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell.init(style: .`default`, reuseIdentifier: nil)
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 30))
		headerView.backgroundColor = UIColor.lightGray
		return headerView
	}
}

