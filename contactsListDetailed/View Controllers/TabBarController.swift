import UIKit

class TabBarController: UITabBarController {
    
    let contactsList = Person.getContacts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers(for: contactsList)
    }
    
    private func setupViewControllers(for contactsList: [Person]) {
        let contactsListVC = viewControllers?.first as! ContactsListViewController
        let infoListVC = viewControllers?.last as! InfoListViewController
        
        contactsListVC.contactsList = contactsList
        infoListVC.contactsList = contactsList
    }
    
}
