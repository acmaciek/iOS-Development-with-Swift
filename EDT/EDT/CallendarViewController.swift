//
//  CallendarViewController.swift
//  EDT
//
//  Created by Maciek Girek on 3/29/18.
//  Copyright © 2018 Maciek Girek. All rights reserved.
//

import UIKit

class CallendarViewController: UIViewController {
    
    @IBOutlet weak var callendar: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://calendar.google.com/calendar/embed?src=chicagoedt.org_8sko6rb2p999hdndovihq8ul60%40group.calendar.google.com&ctz=America%2FChicago")
        callendar.loadRequest(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
