//
//  ViewController.swift
//  RSSFeed
//
//  Created by Giorgi Gogichaishvili on 12/25/20.
//  Copyright © 2020 giorgi gogichaishvili. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import AlamofireRSSParser

class ViewController: UIViewController {
    
    @IBOutlet  var webView: WKWebView!
    
    
    @IBOutlet weak var myNavigationBar: UINavigationBar!
    
    var fxRatePageUrl:URL?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("http://www.nbg.ge/rss.php").responseRSS() { (response) -> Void in
            if let feed: RSSFeed = response.value {
                guard !feed.items.isEmpty else {
                    return
                }
                
                 let item = feed.items[0]
                
                
                self.myNavigationBar.topItem?.title = item.title
                
                self.fxRatePageUrl = URL(string: item.link!)
                
                self.webView.loadHTMLString(item.itemDescription!, baseURL: nil)
                
                
            }
        }
        
    }
    
    @IBAction func didTapButton() {
        if let url = fxRatePageUrl {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
    
    
    
    





    

