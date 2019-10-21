//
//  AppDelegate.swift
//  CFTtest
//
//  Created by Miska  on 19/10/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import UIKit
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let config = Realm.Configuration(
            schemaVersion: 3,
    
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 3) {
                    //Реалм автоматически смотрит изменения, перезаписывает их
                }
        })
        Realm.Configuration.defaultConfiguration = config
        _ = try! Realm()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}

