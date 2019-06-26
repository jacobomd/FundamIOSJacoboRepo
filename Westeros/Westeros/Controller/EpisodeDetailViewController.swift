//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Jacobo Morales Diaz on 25/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    
    // Outles
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelSeasonName: UILabel!
    
    // propiedades
    private var model:Episode
    
    // inicializadores
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
    
}

extension EpisodeDetailViewController {
    private func syncModelWithView() {
        labelName.text = "Episodio \(model.title)"
        labelDate.text = "Fecha emision \(model.date.description)"
        labelSeasonName.text = "\(model.season?.name) episodios emitidos"
    }
}
extension EpisodeDetailViewController: EpisodeListViewControllerDelegate {
    func episodeListViewController(_ viewController: EpisodeListViewController, didSelectHouse episode: Episode) {
        model = episode
        syncModelWithView()
    }
    
    
}
