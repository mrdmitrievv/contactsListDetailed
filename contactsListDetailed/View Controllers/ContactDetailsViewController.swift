import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet var labelForPhone: UILabel!
    @IBOutlet var labelForEmail: UILabel!
    
    var contact: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contact = contact {
            navigationItem.title = contact.fullName
            navigationItem.largeTitleDisplayMode = .never
            labelForPhone.text = "Phone: " + contact.telephoneNumber
            labelForEmail.text = "Email: " + contact.mail
        }
      
    }
}


