

import UIKit

class MainContainerVC: UIViewController {
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //註冊觀察通知者
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(toggleSideMenu),
                                               name: NSNotification.Name("SideMenu"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(Profile),
                                               name: NSNotification.Name("Profile"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(Settings),
                                               name: NSNotification.Name("Settings"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(Logout),
                                               name: NSNotification.Name("Logout"),
                                               object: nil)
    }
    
    
    @objc func Profile() {
        performSegue(withIdentifier: "Profile", sender: nil)
            }
        @objc func Settings() {
        performSegue(withIdentifier: "Settings", sender: nil)
    }

    
   
    @objc func Logout() {
        let changePage
            = self.storyboard?.instantiateViewController(withIdentifier: "LogoutVC") as! LogoutVC
        changePage.modalPresentationStyle = .fullScreen
        self.present(changePage, animated: true, completion: nil)
    }
    
    
    //菜單移動量
    @objc func toggleSideMenu() {
        if sideMenuOpen {
            sideMenuOpen = false
            sideMenuConstraint.constant = -240
        } else {
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    //叫出側邊菜單
    @IBAction func onMoreTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("SideMenu"), object: nil)
    }
    
    
    //隱藏菜單
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if sideMenuOpen == true{
            NotificationCenter.default.post(name: NSNotification.Name("SideMenu"), object: nil)
        }
    }
}


