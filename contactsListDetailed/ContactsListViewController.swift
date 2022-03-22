import UIKit

class ContactsListViewController: UITableViewController {
    
    @IBOutlet var mainTabBar: UITabBar!
    
    let contactsList = Person.getContacts()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTabBar.isTranslucent = false
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return contactsList.count
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactDetailsVC = segue.destination as! ContactDetailsViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow,
              indexPath.row < contactsList.count
        else { return }
        
//        tableView.cellForRow(at: indexPath)?.textLabel?.text != nil
        contactDetailsVC.contact = contactsList[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count + 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row < contactsList.count {
            cell.textLabel?.text = contactsList[indexPath.row].fullName
        } else {
            cell.textLabel?.text = nil
            cell.isUserInteractionEnabled = false
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if tableView.cellForRow(at: indexPath)?.textLabel?.text != nil {
//            tableView.allowsSelection
//        } else { tableView.cellForRow(at: indexPath)?.isSelected = false }
//    }
    
    
}

