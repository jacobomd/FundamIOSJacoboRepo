//
//  AppDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 10/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

// should - will - did
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Lanzar la app
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        // Crear el modelo
        let houses = Repository.local.houses
        
        // Creamos los controladores
        let houseListViewController = HouseListViewController(model: houses)
        let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        
        let houseDetailViewController = HouseDetailViewController(model: lastSelectedHouse)
        
        // asignamos delegados
        houseListViewController.delegate = houseDetailViewController
        
        // Los envolvemos en Navigations
        let houseListNavigation = houseListViewController.wrappedInNavigation()
        let houseDetailNavigation = houseDetailViewController.wrappedInNavigation()
        
        // Creamos el split view controller
        let splitViewController = UISplitViewController()
        
        splitViewController.viewControllers = [
            houseListNavigation, // master
            houseDetailNavigation // detail 
        ]
        
        // Asignamos el rootViewController
        window?.rootViewController = splitViewController
        
        return true
    }
}
