//
//  ViewController.swift
//  DropDown-List
//
//  Created by Mohd Tauheed Uddin Siddiqui on 16/11/17.
//  Copyright © 2017 Mohd Tauheed Uddin Siddiqui. All rights reserved.
//

import UIKit
import MMDrawerController

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource, UITextFieldDelegate {
   
    
    //Cell Id for Table View Cell
    let dropDownId = "cellId"
    //Array from which TextField data is compared.
    let array = ["Messi","Cristiano Ronaldo","David Beckham", "Tashi Sidd", "Ronaldinho", "Ronaldo", "Ibrahimnovic", "","Neymar","manuel Neuer","Luis Suarez","Gareth Bale","Andres Iniesta","Lewandoski","Rodriguez","Messi","Cristiano Ronaldo","David Beckham", "Tashi Sidd", "Ronaldinho", "Ronaldo", "Ibrahimnovic", "","Neymar","manuel Neuer","Luis Suarez","Gareth Bale","Andres Iniesta","Lewandoski","Rodriguez","Messi","Cristiano Ronaldo","David Beckham", "Tashi Sidd", "Ronaldinho", "Ronaldo", "Ibrahimnovic", "","Neymar","manuel Neuer","Luis Suarez","Gareth Bale","Andres Iniesta","Lewandoski","Rodriguez","Messi","Cristiano Ronaldo","David Beckham", "Tashi Sidd", "Ronaldinho", "Ronaldo", "Ibrahimnovic", "","Neymar","manuel Neuer","Luis Suarez","Gareth Bale","Andres Iniesta","Lewandoski","Rodriguez","Messi","Cristiano Ronaldo","David Beckham", "Tashi Sidd", "Ronaldinho", "Ronaldo", "Ibrahimnovic", "","Neymar","manuel Neuer","Luis Suarez","Gareth Bale","Andres Iniesta","Lewandoski","Rodriguez"]
    //Temporary array which is filled when a particular match is attained
    var autoComplete : [String] = []
    
    //Creating TextField Programmatically
    var textfield : UITextField  = { //Creating a textfield with UITextfield closure
        //Creating ImageView inside an textfield
        var image : UIImageView = { //Creating a textfield with UIImageView closure
           let ig = UIImageView()
            ig.image = UIImage(named : "drop-down")
            return ig //Returning ig
        }()
        let tf = UITextField()
        tf.backgroundColor = UIColor(white: 0.7, alpha: 0.8)
        //Adding the Dropdown Image in the textfield
        tf.addSubview(image)
        tf.addConstraintsWithFormat(format: "H:[v0(50)]|", views: image)
        tf.addConstraintsWithFormat(format: "V:[v0(50)]|", views: image)
        tf.clearsOnBeginEditing = true
        tf.clearButtonMode = UITextFieldViewMode.always
        return tf
    }()
    
    
    //Creating table view
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.bounces = false
        //Setting delegate and datasource
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    //Creating TextView
    var textView : UITextView = {
       let tv = UITextView()
        tv.text = "Search for your favourite football player. Example Tashi Sidd"
        tv.isEditable = false
        tv.backgroundColor = .clear
        return tv
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewView()
        textfield.delegate = self
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
    }
    func addNewView() {
        view.addSubview(textfield)
        view.addSubview(tableView)
        view.addSubview(textView)
        //Registering the cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: dropDownId)
        view.addConstraintsWithFormat(format : "V:|-200-[v0(50)]-[v1(200)]",views: textfield,tableView)
        
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: textfield)
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: tableView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: textView)
        view.addConstraintsWithFormat(format: "V:|-150-[v0(50)]", views: textView)
        view.hideKeyboardWhenTappedAround()
        //hide the table view initially
        tableView.isHidden = true
        
    }
//TableView Functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dropDownId, for: indexPath)
        if textfield.isEditing{
        cell.textLabel?.text = autoComplete[indexPath.row]
        return cell
        }
        return cell
    }
    //Returning sections as per match
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoComplete.count
    }
    //After selecting Particular match!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        textfield.text = selectedCell.textLabel?.text
        view.endEditing(true)
        tableView.isHidden = true
    }

//Text Field setups
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textfield.hasText{
            tableView.reloadData() //Reload Table View
            tableView.isHidden = false
        }
        
        let substring = (textField.text!.lowercased() as NSString).replacingCharacters(in: range, with: string)
        seachAutoCompleteWithSubstring(substring)
        return true
    }
    
    func seachAutoCompleteWithSubstring(_ substring : String){
        autoComplete.removeAll(keepingCapacity: false)
        if textfield.isEditing{
            for key in array{
                let myString:NSString! = key.lowercased() as NSString
                
                let substringRange :NSRange! = myString.range(of: substring)
                
                if (substringRange.location  == 0)
                {
                    autoComplete.append(key)
                }
                tableView.reloadData()
            }
        }else {
            tableView.isHidden = true
        }
    }
}

