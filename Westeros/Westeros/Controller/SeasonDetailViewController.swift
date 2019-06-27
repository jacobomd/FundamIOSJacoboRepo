//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Jacobo Morales Diaz on 25/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    
    // Oulets
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelNumEpisodes: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    //Propierties
    private var model : Season
    
    
    // Initialization
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
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

extension SeasonDetailViewController {
    private func syncModelWithView() {
        labelName.text = "Temporada \(model.name)"
        labelDate.text = "Fecha emision \(model.date.description)"
        labelNumEpisodes.text = "\(model.count) episodios emitidos"
        labelDescription.text = "Resumen \(model.resumen)"
    }
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectHouse season: Season) {
        model = season
        syncModelWithView()
    }
    
    
}


