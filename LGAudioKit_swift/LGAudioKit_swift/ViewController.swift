//
//  ViewController.swift
//  LGAudioKit_swift
//
//  Created by ligang on 2018/1/29.
//  Copyright © 2018年 LG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	public var dataArray: NSMutableArray = []
	public var tableView: UITableView!

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
		tableView.backgroundColor = .white
		tableView.delegate = self
		tableView.dataSource = self
		self.view.addSubview(tableView)
		self.tableView = tableView
	}
	
	@objc func initButton() {
		let screenW = self.view.bounds.width
		let screemH = self.view.bounds.height
		let button = UIButton(type: .custom)
		button.frame = CGRect(x: 10, y: screemH - 40, width: screenW - 20, height: 30)
		button.setTitleColor(.blue, for: .selected)
		button.setTitle("按住录音", for: .normal)
		button.addTarget(self, action: #selector(startRecordVoice) , for: .touchDown)
		button.addTarget(self, action: #selector(cancelRecordVoice) , for: .touchUpOutside)
		button.addTarget(self, action: #selector(confirmRecordVoice) , for: .touchUpInside)
		button.addTarget(self, action: #selector(updateCancelRecordVoice) , for: .touchDragExit)
		button.addTarget(self, action: #selector(updateContinueRecordVoice) , for: .touchDragEnter)
		button.layer.borderColor = UIColor.black.cgColor
		button.layer.borderWidth = 1
		button.layer.cornerRadius = 4
		button.layer.masksToBounds = true
		self.view.addSubview(button)
	}
	
	@objc func startRecordVoice() {
		print("startRecordVoice...")
	}
	
	@objc func cancelRecordVoice() {
		print("cancelRecordVoice...")
	}
	
	@objc func confirmRecordVoice() {
		print("confirmRecordVoice...")
		let soundModel = [
			"soundFilePath": "",
			"seconds": 5
			] as [String : Any]
		self.dataArray.addObjects(from: [soundModel])
		self.tableView.reloadData()
	}
	
	@objc func updateCancelRecordVoice() {
		print("updateCancelRecordVoice...")
	}
	
	@objc func updateContinueRecordVoice() {
		print("updateContinueRecordVoice...")
	}
}

extension ViewController: UITableViewDelegate {
	
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.dataArray.count
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell.init(style: .`default`, reuseIdentifier: nil)
		let data: NSDictionary = self.dataArray[indexPath.row] as! NSDictionary
		cell.textLabel?.text = String(describing: data["seconds"])
		cell.backgroundColor = .purple
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let textView = UITextView.init(frame: CGRect.init(x: 0, y: 60, width: self.view.frame.size.width, height: 100))
		textView.backgroundColor = UIColor.red
		textView.text = "欢迎使用本框架\n\n如果在使用过程中遇到问题请及时提issue\n博客:http://blog.csdn.net/gang544043963";
		textView.textAlignment = NSTextAlignment.center
		textView.font = UIFont.systemFont(ofSize: 17)
		return textView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 100
	}
}

