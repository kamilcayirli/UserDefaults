//
//  ViewController.swift
//  UserDefaults
//
//  Created by Kadir Kemal Dursun on 26.03.2019.
//  Copyright © 2019 Kadir Kemal Dursun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var names:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let temp  = UserDefaults.standard.array(forKey: "names")
        if(temp != nil){
            names = temp as! [String]
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        vc.delegate = self
        
        let selectedRow = table.indexPathForSelectedRow!.row
        
        if(selectedRow < names.count){
            vc.defaultName = names[selectedRow]
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if(indexPath.row < names.count){
             cell!.textLabel?.text = names[indexPath.row]
        }
        else{
            cell?.textLabel?.text = "Yeni Ekle"
        }
        
        return cell!
    }
}

extension ViewController:DetailViewControllerDelegate {
    func setName(_ name: String) {
        let selectedRow = table.indexPathForSelectedRow!.row
        
        if(selectedRow < names.count){
            names[selectedRow] = name
        }
        else{
            names.append(name)
        }
        
        table.reloadData()
        
        
        UserDefaults.standard.set(names, forKey: "names")
    }
}
