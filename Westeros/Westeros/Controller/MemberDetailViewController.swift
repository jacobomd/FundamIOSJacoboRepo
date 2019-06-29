//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Jacobo Morales Diaz on 28/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
}

extension MemberDetailViewController {
    private func syncModelWithView() {
        labelfullName.text = " \(model.fullName)"
        imageMember.image = model.image
        labelAlias.text = "Alias \(model.alias)"
    }
}




