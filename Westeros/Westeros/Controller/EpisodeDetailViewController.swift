

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
        labelDate.text = "Fecha emision \(model.description)"
        labelSeasonName.text = "Pertence a la \(model.season!.name) "
    }
}

