//
//  ProjectViewController.swift
//  EDT
//
//  Created by Maciek Girek on 3/29/18.
//  Copyright © 2018 Maciek Girek. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    let projects = ["STELLA","SIMPLE","RMC","ARTIST","REVO","GLADOS","IARC","GENTLE BREEZE"]
    
    @IBOutlet weak var vController: UITableView!
    
    override func viewDidLoad() {
        vController.delegate = self
        vController.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell1") as! ProjectViewCell
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.projectLabel.text = projects[indexPath.row]
        return cell
    }
    

}
