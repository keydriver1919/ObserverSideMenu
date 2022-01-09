


import UIKit

class SideMenuVC: UITableViewController {
    
    
    //發布通知
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        NotificationCenter.default.post(name: NSNotification.Name("SideMenu"), object: nil)
        
        switch indexPath.row {
        case 0: NotificationCenter.default.post(name: NSNotification.Name("Profile"), object: nil)
        case 1: NotificationCenter.default.post(name: NSNotification.Name("Settings"), object: nil)
        case 2: NotificationCenter.default.post(name: NSNotification.Name("Logout"), object: nil)
        default: break
        }
    }
}
