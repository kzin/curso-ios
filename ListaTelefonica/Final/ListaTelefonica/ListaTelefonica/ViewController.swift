//
//  ViewController.swift
//  ListaTelefonica
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UITableViewController {

    var locais = [Local]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Service.sharedInstance.getLocais { (result) in
            self.locais = result
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locais.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! LocalTableViewCell
        
        cell.localCategoria?.text = locais[indexPath.row].category
        cell.localNome?.text = locais[indexPath.row].name
        cell.localImageView?.sd_setImageWithURL(NSURL(string: locais[indexPath.row].image!))
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let local = locais[indexPath.row]
        
        let alert = UIAlertController(title: "", message: "Escolha o número", preferredStyle: .ActionSheet)
        
        for telefone in local.phones! {
            let option = UIAlertAction(title: telefone, style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                let phone = "tel://"+telefone.stringByReplacingOccurrencesOfString("-", withString: "")
                let URL = NSURL(string: phone)!
                if(UIApplication.sharedApplication().canOpenURL(URL)) {
                    UIApplication.sharedApplication().openURL(URL)
                }
            })
            alert.addAction(option)
        }
        
        let cancelar = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("cancelado")
        })
        alert.addAction(cancelar)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}

