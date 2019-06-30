

import UIKit

class MemberDetailViewController: UIViewController {
    
    @IBOutlet weak var labelfullName: UILabel!
    
    @IBOutlet weak var imageMember: UIImageView!
    
    @IBOutlet weak var labelAlias: UILabel!
    
    // propiedades
    private var model:Person
    
    // inicializadores
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

extension MemberDetailViewController {
    private func syncModelWithView() {
        labelfullName.text = " \(model.fullName)"
        imageMember.image = model.image
        labelAlias.text = "Alias \(model.alias)"
    }
}



extension MemberDetailViewController {
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
        
        
        // Sincronizar modelo y vista
        //navigationController?.popToViewController(MemberListViewController(model: house.sortedMembers), animated: true)
        //navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
        
    }
}




