import UIKit

class TabBarController: UITabBarController {

    
    
    @IBOutlet var addContactButton: UIBarButtonItem!
    
    var contactsList = Person.getContacts()
    
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
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "addNewContact" else { return }
        
        let newContactVC = segue.destination as! NewContactViewController
        newContactVC.delegate = self
 
    }
    
}

extension TabBarController: ContactViewControllerDelegate {
    func saveContact(_ contact: Person) {
        let contactsListVC = viewControllers?.first as! ContactsListViewController
        let infoListVC = viewControllers?.last as! InfoListViewController
        
        contactsList.append(contact)
        setupViewControllers(for: contactsList)
        contactsListVC.mainTableView.reloadData()
        if infoListVC.isViewLoaded {
            infoListVC.mainTableView.reloadData()
        }
    }
}
