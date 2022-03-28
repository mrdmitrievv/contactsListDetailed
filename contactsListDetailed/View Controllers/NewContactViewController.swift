import UIKit

protocol ContactViewControllerDelegate: AnyObject {
    func saveContact(_ contact: Person)
}

class NewContactViewController: UIViewController {
    
    // MARK : IB-Outlets
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    
    // MARK: public properties
    var newContact = Person(name: "", surname: "", mail: "", telephoneNumber: "")
    weak var delegate: ContactViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDoneButton(to: NameTextField, surnameTextField, phoneTextField, emailTextField)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        guard newContact.name != "",
              newContact.surname != "",
              newContact.telephoneNumber != "",
              newContact.mail != ""
              else {
            return
        }
        delegate?.saveContact(newContact)
        self.dismiss(animated: true, completion: nil)
    }
}


extension NewContactViewController {
    
    private func showNewContact(_ contact: Person) {
        print(contact)
    }
    
    private func addDoneButton(to textFields: UITextField...) {
        
        textFields.forEach { textField in
            let keyboardToolBar = UIToolbar()
            textField.inputAccessoryView = keyboardToolBar
            keyboardToolBar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(didTapOne))
        
        let flexibleButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil)
            
            keyboardToolBar.items = [flexibleButton, doneButton]
        }
    }
    
    @objc func didTapOne() {
        view.endEditing(true)
    }
    
}
    


extension NewContactViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text else { return }
        
            switch textField.tag {
            case 0: newContact.name = text
            case 1: newContact.surname = text
            case 2:
                if let currentValue = Float(text) {
                    newContact.telephoneNumber = String(currentValue)
                }
            case 3: newContact.mail = text
            default: break
            }        
    }
}
