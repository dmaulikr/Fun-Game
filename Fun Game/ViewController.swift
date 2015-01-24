z//
//  ViewController.swift
//  Fun Game
//
//  Created by Lucas Haber on 1/24/15.
//  Copyright (c) 2015 lhaber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var http: RoutingHTTPServer;
    
    required init(coder aDecoder: NSCoder) {
        http = RoutingHTTPServer()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        http.setPort(8000)
        http.setDefaultHeader("Server", value: "Fun Game/1.0")
        
        
        
        http.get("/hello", withBlock: { (request: RouteRequest!, response: RouteResponse!) -> Void in
            response.setHeader("Content-Type", value: "text/plain")
            response.respondWithString("Hello!")
        })
        
        
        http.start(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

