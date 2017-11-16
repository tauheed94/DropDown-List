//
//  sideMenu.swift
//  DropDown-List
//
//  Created by Mohd Tauheed Uddin Siddiqui on 17/11/17.
//  Copyright © 2017 Mohd Tauheed Uddin Siddiqui. All rights reserved.
//

import UIKit
class sideMenu: UIViewController , UITableViewDelegate , UITableViewDataSource {
    let menuArray = ["Profile", "Sign In", "Settings"]
    let tableId = "tableId"
    
    lazy var tableView : UITableView = {
       let tv = UITableView()
        tv.backgroundColor = .clear
        tv.bounces = false
        tv.delegate = self
        tv.dataSource = self
        tv.tintColor = .black
        return tv
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableId, for: indexPath)
        cell.textLabel?.text = menuArray[indexPath.row]
        return cell
    }
    
    
    
    
    
    override func viewDidLoad() {
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat(format: "V:|-200-[v0(150)]", views: tableView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableId)
    }
}
