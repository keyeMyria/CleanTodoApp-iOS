//
//  AppDelegate.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/17.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import UIKit
import Apollo

let graphQLEndpoint = "https://api.graph.cool/simple/v1/cj8ec79st17ul0124siyjhzff"
let apollo = ApolloClient(url: URL(string: graphQLEndpoint)!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        
        let vc = TodoListBuilder().build()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        
        return true
    }

}

