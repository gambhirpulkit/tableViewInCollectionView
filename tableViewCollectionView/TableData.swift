//
//  TableData.swift
//  tableViewCollectionView
//
//  Created by Dignitas Digital on 7/21/15.
//  Copyright (c) 2015 Dignitas Digital. All rights reserved.
//

import Foundation

class TableData {
    
    var title : String?
    
    var url : String?
    
    var movie : String?
    
    var name : String?
    
    var category : String?
    
    init(data : NSDictionary){
        
        self.name = getStringFromJSON(data, key:  "name")
        
        self.title = getStringFromJSON(data, key:  "post_content")
        
        self.movie = getStringFromJSON(data, key: "post_title")
        
        
        self.url = getStringFromJSON(data,key: "term_id")
        
        self.category = getStringFromJSON(data, key: "category")
        
    }
    func getStringFromJSON(data: NSDictionary, key: String) -> String{
        
        
        
        let info : AnyObject? = data[key]
        
        if let info = data[key] as? String {
            //  println(key)
            // println(info)
            
            return info
        }
        return ""
    }
    
}