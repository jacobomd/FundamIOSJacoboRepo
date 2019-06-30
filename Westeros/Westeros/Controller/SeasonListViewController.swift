

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
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
 
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
        
        // Sicronizar modelo(house)-vista(celda)
        
        cell.textLabel?.text = season.name
        cell.imageView?.image = season.image
        
        
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
        
        
        // Mandamos la misma información a través de las notificacions
        let notificationCenter = NotificationCenter.default
        
        let dictionary = [Constants.seasonKey: season]
        
        let notification = Notification(
            name: .seasonDidNotificationName,
            object: self,
            userInfo: dictionary
        )
        
        notificationCenter.post(notification)
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


