//
//  DetailViewController.swift
//  UserDefaults
//
//  Created by Kadir Kemal Dursun on 26.03.2019.
//  Copyright © 2019 Kadir Kemal Dursun. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func setName(_ name:String)
}

class DetailViewController: UIViewController {
    
    weak var delegate: DetailViewControllerDelegate?
    
    var defaultName:String?
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txtName.text = defaultName
    }
    
    
    @IBAction func onClickedButton(_ sender: Any) {
        if(txtName.text?.count == 0){
            return
        }
        
        delegate?.setName(txtName.text!)
        self.navigationController!.popViewController(animated: true)
    }
    
}
