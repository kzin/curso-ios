//
//  WebViewController.swift
//  EventosCatracaLivre
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var data: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if data != nil {
            webView.loadHTMLString(data!, baseURL: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
