import UIKit

class InfoListViewController: UITableViewController {
    
    var contactsList: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contactsList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle = contactsList[section].fullName
        return sectionTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contact = contactsList[indexPath.section]
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = contact.telephoneNumber
            cell.imageView?.image = UIImage(systemName: Contacts.phone.rawValue)
        default:
            cell.textLabel?.text = contact.mail
            cell.imageView?.image = UIImage(systemName: Contacts.email.rawValue)
        }
                        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
