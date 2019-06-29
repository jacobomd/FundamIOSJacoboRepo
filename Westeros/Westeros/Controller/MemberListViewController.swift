//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 18/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

//protocol MemberListViewControllerDelegate: class {
//    func memberListViewController(
//        _ viewController: MemberListViewController,
//        didSelectHouse episode: Person
//    )
//}

class MemberListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var model: [Person]
    //weak var delegate:MemberListViewControllerDelegate?
    
    // MARK: Initialization
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // OJO. No olvidarse de asignar el dataSource
        tableView.dataSource = self
        tableView.delegate = self

        subscribeToNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeNotifications()
    }
}

// MARK: Table view data source
extension MemberListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "PersonCell"
        // Descubrir qué persona tengo que mostrar
        let person = model[indexPath.row]
        
        // Crear la celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        // sincronizar model-view
        cell.textLabel?.text = person.fullName
        cell.detailTextLabel?.text = person.alias
        
        // Devolver la celda
        return cell 
    }
    
}

extension MemberListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = model[indexPath.row]
        let memberDetailViewController = MemberDetailViewController(model: member)
        navigationController?.pushViewController(memberDetailViewController, animated: true)
    }
    
    
}

extension MemberListViewController {
    private func subscribeToNotifications() {
        let notificationCenter = NotificationCenter.default
        // Nos damos de alta en las notifications
        notificationCenter.addObserver(
            self,
            selector: #selector(houseDidChange),
            name: .houseDidNotificationName,
            object: nil) // Objecto que envia la notification
    }
    
    private func unsubscribeNotifications() {
        // Nos damos de baja de las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc private func houseDidChange(notification: Notification) {
        // Averiguar la casa
        guard let dictionary = notification.userInfo else {
            return
        }
        
        guard let house = dictionary[HouseListViewController.Constants.houseKey] as? House else {
            return
        }
        
        // Actualizar el modelo
        model = house.sortedMembers
        
        // Sincronizar modelo y vista
        tableView.reloadData()
        
    }
}

