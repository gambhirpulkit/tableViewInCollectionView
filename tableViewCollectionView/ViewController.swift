//
//  ViewController.swift
//  tableViewCollectionView
//
//  Created by Dignitas Digital on 7/21/15.
//  Copyright (c) 2015 Dignitas Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UICollectionViewDelegate {
        var bollyArray = [String]()
    @IBOutlet var tableView: UITableView!
      var links : [TableData]!
    var winks : [CollectData]!
    
    var flag: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        links = [TableData]()
        winks = [CollectData]()
        let api = TableAPI()
        let apic = CollectAPI()

        apic.loadShots("https://gist.githubusercontent.com/yashikanagpal/f21d89047df04642c464/raw/94c3f1b90dfc1706433b1e3a28bd889168845675/updated", completion: didLoadShotsc)

        api.loadShots("https://gist.githubusercontent.com/gambhirpulkit/1c46c07bf72651770b37/raw/8c24a697a0c76e290b9053959fd0c22763ee46ed/gistfile1.txt", completion: didLoadShots)
        

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(Bool())
        
    }
 
    func didLoadShots(links: [TableData]) {
        self.links = links
        tableView.reloadData()
        tableView.allowsSelection = false
        // println(links.count)
    }
    
    func didLoadShotsc(winks: [CollectData]) {
        self.winks = winks
       // println(self.winks)
        println(self.winks.count)
        for i in 0..<winks.count {
            println(self.winks[i])
            if self.winks[i].category == "Bollywood" {
                self.bollyArray.append(self.winks[i].movie!)
            }
        }
        println("\(self.bollyArray)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as! UITableViewCell
        
        let linksCell = links[indexPath.row] as TableData
        
        if let linkLabel = cell.viewWithTag(1) as? UILabel {
            linkLabel.text = linksCell.category
        }
        
        if let collectView = cell.viewWithTag(3) as? UICollectionView {
            collectView.reloadData()
        
       // NSNotificationCenter.defaultCenter().postNotificationName("load1", object: nil)
  
        if((indexPath.row)==0) {
        flag = 1
      //  NSNotificationCenter.defaultCenter().postNotificationName("load1", object: nil)
        }
        if((indexPath.row)==1) {
        flag = 2
        }
        if((indexPath.row)==2) {
        flag = 3
        }
        if((indexPath.row)==3) {
        flag = 4

        }
        
        }
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bollyArray.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        
       // let collectCell = collectionView.cellForItemAtIndexPath(indexPath) as UICollectionViewCell?
      //  let winksCell = winks[indexPath.row] as CollectData
       // if winksCell.category == "Bollywood" {
            
        
       // let random = links[indexPath.row].url! as String?
        
        //     var img =  UIImage(data: NSData(contentsOfURL: NSURL(string:"\(random)")!)!)
       // var img: NSURL = NSURL(string: random!)!
      //  var test =  UIImage(data: NSData(contentsOfURL: img)!)
    //    println(test)
        //   println(img)
        println("\(flag)")
        if flag == 1 {
        if let linkLabel = collectCell.viewWithTag(2) as? UILabel {
            linkLabel.text = bollyArray[indexPath.row]
            // println(linkLabel.text)
        }
        }
      //  println("\(flag)")
        
        return collectCell
    }

}

