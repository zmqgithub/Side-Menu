//
//  SideMenuVC.swift
//  SideMenu
//
//  Created by ODA on 22/03/18.
//  Copyright © 2018 ODA. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {
//    let menuItems = ["Item 1","Item 2","Item 3","Item 4", "Item 5","Item 6", "Item 7","Item 8"]

    let menuItems:[MenuItem] = [MenuItem(name: "item 1", icon: "ic-0"),
                     MenuItem(name: "item 2", icon: "ic-1"),
                     MenuItem(name: "item 3", icon: "ic-2"),
                     MenuItem(name: "item 4", icon: "ic-3"),
                     MenuItem(name: "item 5", icon: "ic-4"),
                     MenuItem(name: "item 6", icon: "ic-5"),
                     MenuItem(name: "item 7", icon: "ic-6"),
                     MenuItem(name: "item 8", icon: "ic-7"),
                     MenuItem(name: "item 9", icon: "ic-8"),
                     MenuItem(name: "item 10", icon: "ic-9")]
    
    
    var onSelected:((_ data:MenuItem) ->())?
    
    @IBOutlet var tableViewConstrain: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func actionClose(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        let item = menuItems[indexPath.row]
        cell.uiLabel?.text = item.nameString
        cell.uiIcon.image = UIImage(named: item.iconString)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelected?(menuItems[indexPath.row])
        dismiss(animated: true)
    }
}

