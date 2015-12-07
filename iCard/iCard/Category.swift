//
//  Category.swift
//  iCard
//
//  Created by Carlos Caballero on 12/6/15.
//  Copyright © 2015 iosdecal. All rights reserved.
//

import UIKit

class Data: NSObject {
    // 2-d list containing (category_name, id) pairs. 
    // Both fields are Strings. Should be filled using 
    // getCategories() when ViewDidLoad() is called in 
    // the controller.
    var categories = [[String]]()
    

    // Make a request to jservice.io to get json data. 
    // extract category name and id from the response and
    // fill the class variable categories.
    // use this query: 
    // jservice.io/api/categories?count=100
    func getCategories() {
        
    }
    

    // Make a request to jservice.io to get json data.
    // extract question and answer pairs, store them into
    // a 2-d list of Strings and return.
    // Use query like:
    // jservice.io/api/categories?id=1
    func getQuestionsByCategory(id: Int) ->[[String]] {
        return [[String]]()
    }
}


