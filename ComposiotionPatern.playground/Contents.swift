import UIKit



protocol EmailValidator {
    func validateEmail()
}

struct Email: EmailValidator {
    func validateEmail() {
         print("validate email")
    }
}

protocol PasswordValidator {
    func validatePassword()
}

struct Password: PasswordValidator {
    func validatePassword() {
        print("validate password")
    }
}

class ViewController: UIViewController {
    typealias Validator = EmailValidator & PasswordValidator
    let validator: Validator
    init(validator: Validator) {
        self.validator = validator
        super.init(nibName: nil, bundle: nil)
    }
    
    func validateFields() {
        validator.validateEmail()
        validator.validatePassword()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//let vc = ViewController(validator: Password() & Email())
//let vc = ViewController(validator: ViewController.Validator(...))
