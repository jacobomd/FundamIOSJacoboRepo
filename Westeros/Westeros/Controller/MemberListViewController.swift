//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 18/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    let model: [Person]
    
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

