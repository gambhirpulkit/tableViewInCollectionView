//
//  CollectAPI.swift
//  tableViewCollectionView
//
//  Created by Dignitas Digital on 7/21/15.
//  Copyright (c) 2015 Dignitas Digital. All rights reserved.
//

import Foundation

class CollectAPI {
    var instance = ViewController()
    func loadShots(shotsUrl: String, completion: (([CollectData]) -> Void)!) {
        
        let accessToken = "dc5a71673c52e02fb510a7bf514789a90c1d9c169c13edbd92e5e19ba74a5f56"
        //  var urlString = shotsUrl + "?access_token=" + accessToken + "&page=1&per_page=25"
        var urlString = shotsUrl
        var appArray : NSMutableArray = []
        var catArray : [String] = ["Bollywood","Hollywood","Tollywood","Punjabi"]
        println("NSURLSession: \(urlString)")
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(shotsUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                
                println(error.description)
                println(error.localizedDescription)
            } else {
                
                var error : NSError?
                
                println("Begin Serialization: ")
                println(data.length)
                
                
                var shotsDataArray = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as! NSDictionary
                
                var NewsDictionary = (shotsDataArray.valueForKey("trailers")) as! NSArray
                
                //    var potsDataArray = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as! NSArray
                
 
                for i in catArray {
                
                var paperDictionary = (NewsDictionary.valueForKey("\(i)")) as! NSArray
                    var arr = paperDictionary[0] as! NSArray
                    appArray.addObject(arr)
                }
                

                
                //println(shotsDataArray)
                // println(NewsDictionary)
                var shots = [CollectData]()
                //  println(NewsDictionary.count)
                // println(paperDictionary.count)
                
           //     println(appArray[0])
                
                for i in 0..<catArray.count {
                var zapArray = appArray[i] as! NSArray
              //  println(zapArray)
              //  println(zapArray)
                for shot in zapArray {
                    
                    let shot = CollectData(data:shot as! NSDictionary)
                    
                    shots.append(shot as CollectData)
              

                    
                }
                    
                }
             //   println(shots)
                /*
                NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList1:",name:"load1", object: nil)
   
                func loadList1(notification: NSNotification){
                    //load data here
                    println("hery")
                }
*/
               /*
                if self.instance.flag == 1 {
                    println("hey")
                }
                else {
                    println("kya be")
                }
        */
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(shots)
                    }
                }
                
            }
        }
        
        task.resume()
    }
    
    
    
}