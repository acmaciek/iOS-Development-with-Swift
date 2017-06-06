//
//  SecondTableViewController.swift
//  TableDataPass
//
//  Created by Maciek Girek on 5/31/17.
//  Copyright © 2017 Maciek Girek. All rights reserved.
//

import UIKit

class SecondTableView: UITableViewController {

  var coordinates = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return coordinates.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell2 = self.tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
    cell2.textLabel?.text = coordinates[indexPath.row]
    return cell2
  }
  
}
