//
//  TableAPI.swift
//  tableViewCollectionView
//
//  Created by Dignitas Digital on 7/21/15.
//  Copyright (c) 2015 Dignitas Digital. All rights reserved.
//


import Foundation

class TableAPI {
    
    func loadShots(shotsUrl: String, completion: (([TableData]) -> Void)!) {
        
        let accessToken = "dc5a71673c52e02fb510a7bf514789a90c1d9c169c13edbd92e5e19ba74a5f56"
        
        var urlString = shotsUrl
        
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
                
                var NewsDictionary = (shotsDataArray.valueForKey("trailer")) as! NSArray
                
                //  println(shotsDataArray)

                var shots = [TableData]()
                println(NewsDictionary.count)
                
                
                for shot in NewsDictionary{
                    
                    
                    
                    let shot = TableData(data:shot as! NSDictionary )
                    
                    
                    
                    shots.append(shot as TableData)
                    
                    
                }
                
                
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