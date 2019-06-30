

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeNotifications()
    }
    
}

extension EpisodeDetailViewController {
    private func syncModelWithView() {
        labelName.text = "Episodio \(model.title)"
        labelDate.text = "Fecha emision \(model.description)"
        labelSeasonName.text = "Pertence a la \(model.season!.name) "
    }
}

extension EpisodeDetailViewController {
    private func subscribeToNotifications() {
        let notificationCenter = NotificationCenter.default
        // Nos damos de alta en las notifications
        notificationCenter.addObserver(
            self,
            selector: #selector(seasonDidChange),
            name: .seasonDidNotificationName,
            object: nil) // Objecto que envia la notification
    }
    
    private func unsubscribeNotifications() {
        // Nos damos de baja de las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc private func seasonDidChange(notification: Notification) {
        // Averiguar la casa
        guard let dictionary = notification.userInfo else {
            return
        }
        
        guard let season = dictionary[SeasonListViewController.Constants.seasonKey] as? Season else {
            return
        }
        
        // Actualizar el modelo
       
    
        // Sincronizar modelo y vista
        // navigationController?.popToViewController(EpisodeListViewController(model: season.sortedEpisodess), animated: true)
        // navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
        
    }
}

