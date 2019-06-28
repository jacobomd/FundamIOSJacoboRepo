//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Jacobo Morales Diaz on 25/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

protocol EpisodeListViewControllerDelegate: class {
    func episodeListViewController(
        _ viewController: EpisodeListViewController,
        didSelectHouse episode: Episode
    )
}

class EpisodeListViewController: UITableViewController {
    
    // propiedades
    private let model: [Episode]
    weak var delegate:EpisodeListViewControllerDelegate?
    
    // inicializadores
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cellId = "PersonCell"
        // Descubrir qué episodio tengo que mostrar
        let episode = model[indexPath.row]
        
        // Crear la celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ??
            UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // sincronizar model-view
        cell.textLabel?.text = episode.title
        
        
        // Devolver la celda
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar qué episodio se ha pulsado
        let episode = model[indexPath.row]
        
        // Avisar al delegado.
        // Enviamos la información de que se ha seleccionado un episodio
        delegate?.episodeListViewController(self, didSelectHouse: episode)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
