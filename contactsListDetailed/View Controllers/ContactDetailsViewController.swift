import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet var labelForPhone: UILabel!
    @IBOutlet var labelForEmail: UILabel!
    
    var contact: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add some comments
        
        if let contact = contact {
            navigationItem.title = contact.fullName
            labelForPhone.text = "Phone: " + contact.telephoneNumber
            labelForEmail.text = "Email: " + contact.mail
        }
      
    }
}


