//
//  ViewController.swift
//  PocketAttendance
//
//  Created by Mac on 6/13/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        get()
    }
    var values:NSArray=[]
    
    func get(){
        let url=NSURL(string:"http://10.178.111.53/showMovies.php")
        let data=NSData(contentsOfURL: url!)
        values=try!
            NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            as! NSArray
        print(String(values[1]) + " "+String(values.count))
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(values.count)
        return values.count;
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text=values[indexPath.row] as? String
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        // self.performSegueWithIdentifier("loginView", sender: self)
    }
    
}

