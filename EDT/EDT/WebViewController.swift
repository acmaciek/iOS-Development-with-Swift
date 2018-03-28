//
//  WebViewController.swift
//  EDT
//
//  Created by Maciek Girek on 3/27/18.
//  Copyright © 2018 Maciek Girek. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webVC: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://en.wikipedia.org/wiki/Chicago_Engineering_Design_Team")
        webVC.loadRequest(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
