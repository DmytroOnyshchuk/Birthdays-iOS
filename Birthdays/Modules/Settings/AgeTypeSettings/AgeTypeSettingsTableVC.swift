//
//  AgeTableViewController.swift
//  Birthdays
//
//  Created by Dima on 09.01.2021.
//

import UIKit

class AgeTypeSettingsTableVC: UITableViewController {

    @IBOutlet var ageTabelView: UITableView!
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var upcomingTableViewCell: UITableViewCell!
    @IBOutlet weak var currentTableViewCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("SETTINGS_CONTACT_AGE_TYPE", comment: "")
        upcomingLabel.text = NSLocalizedString("SETTINGS_CONTACT_AGE_TYPE_UPCOMING", comment: "")
        currentLabel.text = NSLocalizedString("SETTINGS_CONTACT_AGE_TYPE_CURRENT", comment: "")
        //self.ageTabelView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0);
        setAgeCheckmark()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0,0]:
            UserDefaultsManager.shared.ageType = AgeSettingsEnum.upcoming.rawValue
            setAgeCheckmark()
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
            break
        case [0,1]:
            UserDefaultsManager.shared.ageType = AgeSettingsEnum.current.rawValue
            setAgeCheckmark()
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
            break
        default: break
        }
    }


    func setAgeCheckmark(){

        upcomingTableViewCell.accessoryType = .none
        currentTableViewCell.accessoryType = .none
        
       // let ud = SettingsFunctions.getAgeTypeByUserDefaults()
        let ud = AgeSettingsEnum(rawValue: UserDefaultsManager.shared.ageType) ?? .upcoming
        switch ud {
        case AgeSettingsEnum.upcoming:
            upcomingTableViewCell.accessoryType = .checkmark
            break
        case AgeSettingsEnum.current:
            currentTableViewCell.accessoryType = .checkmark
            break
        }
    }
}
