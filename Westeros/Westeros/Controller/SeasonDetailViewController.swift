

import UIKit

class SeasonDetailViewController: UIViewController {

    
    // Oulets
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelNumEpisodes: UILabel!
    @IBOutlet weak var imageSeason: UIImageView!
    @IBOutlet weak var textDescription: UITextView!
    //Propierties
    private var model : Season
    
    
    // Initialization
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }


}

extension SeasonDetailViewController {
    private func syncModelWithView() {
        labelName.text = " \(model.name)"
        labelDate.text = "Fecha emision: \(model.description)"
        labelNumEpisodes.text = "\(model.count) episodios emitidos"
        imageSeason.image = model.image
        textDescription.text = "Resumen \(model.resumen)"
    }
}


extension SeasonDetailViewController {
    private func setupUI() {
        
        // Creo mi botón
        let episodesButton = UIBarButtonItem(
            title: "Episodes",
            style: .plain,
            target: self,
            action: #selector(displayEpisodes)
        )
        
        // Lo añado a la navigation bar
        navigationItem.rightBarButtonItem = episodesButton
    }

    
    @objc private func displayEpisodes() {
        // Creo el EpisodeListVC
        let episodeListViewController = EpisodeListViewController(model: model.sortedEpisodess)
        
        // Hago push
        navigationController?.pushViewController(
            episodeListViewController,
            animated: true
        )
    }
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectHouse season: Season) {
        model = season
        syncModelWithView()
    }
    
    
}


