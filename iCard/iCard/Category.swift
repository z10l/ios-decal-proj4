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
        let url = NSURL(string: "http://jservice.io/api/categories?count=100")
        var responseError: NSError?
        var response: NSURLResponse?
        var data: NSData?
        let request = NSURLRequest(URL: url!)
        do {
            data = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
        } catch let error as NSError {
            responseError = error
            data = nil
        }
        if data != nil {
            do {
                let jsonResultDic = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? [[String: AnyObject]]
                for dic in jsonResultDic! {
                    var nameAndId = [String]()
                    if let name = dic["title"] as? String {
                        nameAndId.append(name)
                    }
                    if let id = dic["id"] as? Int {
                        nameAndId.append(String(id))
                    }
                    self.categories.append(nameAndId)
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        } else {
            print("Error")
        }
    }
    

    // Make a request to jservice.io to get json data.
    // extract question and answer pairs, store them into
    // a 2-d list of Strings and return.
    // Use query like:
    // jservice.io/api/categories?id=1
    func getQuestionsByCategory(id: Int) ->[[String]] {
        var qaTuple = [[String]]()
        
        let url = NSURL(string: "http://jservice.io/api/category?id=" + String(id))
        var responseError: NSError?
        var response: NSURLResponse?
        var data: NSData?
        let request = NSURLRequest(URL: url!)
        do {
            data = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
        } catch let error as NSError {
            responseError = error
            data = nil
        }
        if data != nil {
//            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            do {
                let jsonResultDic = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? [String:AnyObject]
                    if let list = jsonResultDic!["clues"] as? [[String: AnyObject]] {
                        for dic in list {
                            var qa = [String]()
                            if let question = dic["question"] as? String {
                                qa.append(question)
                            }
                            if let answer = dic["answer"] as? String {
                                qa.append(answer)
                            }
                            if qa[0].isEmpty == false && qa[1].isEmpty == false {
                                qaTuple.append(qa)
                            }
                        }
                    }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        return qaTuple
    }
}


