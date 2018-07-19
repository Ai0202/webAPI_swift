//
//  ViewController.swift
//  webAPItest
//
//  Created by Atsushi on 2018/07/17.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hogeList:[NSDictionary] = []
    
    let urlstr = "https://web-api-sample.herokuapp.com/"
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func tap(_ sender: Any) {
        
        let text = textField.text
        let requestUrl = urlstr + "?text=" + text!
        print(requestUrl)
        
        //let url = URL(string: requestUrl)
        //let request = URLRequest(url: url!)
        
        //test
        //let url2 = URL(string: "http://localhost/web/webAPI_sample/index.php?date=2018%2F07%2F17")
        let url2 = URL(string: "https://web-api-sample.herokuapp.com/?date=2018%2F07%2F19")
        let request = URLRequest(url: url2!)
        
        //sendSynchronousRequestが非推奨だからあとで変更
        let jsonData = (try! NSURLConnection.sendSynchronousRequest(request, returning: nil))
        let jsonDic = (try! JSONSerialization.jsonObject(with: jsonData, options: [])) as! NSDictionary
        
        
        label.text = (jsonDic["day_in_japanese"] as! String)
    }

}

