import UIKit

class ContactsListViewController: UITableViewController {
    
    @IBOutlet var mainTableView: UITableView!
    
    var contactsList: [Person] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetails" else { return }
        let contactDetailsVC = segue.destination as! ContactDetailsViewController
        guard let indexPath = tableView.indexPathForSelectedRow
        else { return }

        contactDetailsVC.contact = contactsList[indexPath.row]        
        
    }        
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = contactsList[indexPath.row].fullName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
}


