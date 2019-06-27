//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Jacobo Morales Diaz on 25/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

protocol SeasonListViewControllerDelegate: class {
    // should
    // will
    // did
    func seasonListViewController(
        _ viewController: SeasonListViewController,
        didSelectHouse season: Season
    )
}

class SeasonListViewController: UITableViewController {
    
    enum Constants {
        static let seasonKey: String = "SeasonKey"
        static let lasSeasonKey = "LastSeasonKey"
    }
    

    // propiedades
    
    private let model: [Season]
    weak var delegate:SeasonListViewControllerDelegate?

    // inicializadores
    
    internal init(model: [Season]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source
    // Data source provee de datos

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "SeasonCell"
        
        // Descubrir cuál es la temporada que tenemos que mostrar
        let season = model[indexPath.row]
        
        // Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ??
            UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sicronizar modelo(temporada)-vista(celda)
        cell.textLabel?.text = season.name
        
        // Devolver la celda
        return cell
    }
    
    func tableview (_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar qué season se ha pulsado
        let season = model[indexPath.row]
        
        // Avisar al delegado.
        // Enviamos la información de que se ha seleccionado una temporada
        delegate?.seasonListViewController(self, didSelectHouse: season)
    }
    
}

extension SeasonListViewController {
    
    private func saveLastSelectedSeason(at index: Int) {
        // Escribimos en UserDefaults
        let userDefaults = UserDefaults.standard
        userDefaults.set(index, forKey: Constants.lasSeasonKey)
        userDefaults.synchronize() // Por si acaso
    }
    
    func lastSelectedSeason() -> Season {
        // Leer de User Defaults
        let userDefaults = UserDefaults.standard
        let lastIndex = userDefaults.integer(forKey: Constants.lasSeasonKey) // 0 is the default
        
        // Devolvemos la temporada
        return model[lastIndex]
    }
}


