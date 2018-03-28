//
//  ViewController.swift
//  EDT
//
//  Created by Maciek Girek on 3/27/18.
//  Copyright © 2018 Maciek Girek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    let elements = ["About","Location","Projects","New Users","Calendar","Credits"]
    let segues = ["1","2","3","4","5","6"]
    @IBOutlet weak var tableView: UITableView!
    // @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ViewControllerID = segues[indexPath.row]
        print("View controller is " + elements[indexPath.row])
        let viewController = storyboard?.instantiateViewController(withIdentifier: ViewControllerID)
        self.navigationController?.pushViewController( viewController!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! TableViewCell
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.infoLabel.text = elements[indexPath.row]
        cell.iconImage.image = UIImage(named: elements[indexPath.row])
        cell.iconImage.layer.cornerRadius = cell.iconImage.frame.height / 2
        return cell
    }
    
   
}
