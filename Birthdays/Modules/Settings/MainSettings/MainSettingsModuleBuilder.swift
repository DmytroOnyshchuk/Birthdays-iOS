//
//  MainSettingsModuleBuilder.swift
//  Birthdays
//
//  Created by Dmitry Onishchuk on 13.06.2021.
//

import UIKit

struct MainSettingsModuleBuilder {
    
    func create() -> UITableViewController {
        let mainSettings = UIStoryboard(name: "MainSettings", bundle: nil).instantiateViewController(withIdentifier: String(describing: MainSettingsTableVC.self)) as! MainSettingsTableVC
        return mainSettings
    }
    
}
