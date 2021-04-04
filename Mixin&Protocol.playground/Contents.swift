import UIKit
//protocol EmailValidator {
//    func validateEmail()
//}
//
//struct Email: EmailValidator {
//    func validateEmail() {
//    }
//}
//
//protocol PasswordValidator {
//    func validatePassword()
//}
//
//struct Password: PasswordValidator {
//    func validatePassword() {
//    }
//}
//
//class ViewController: UIViewController {
//    typealias Validator = EmailValidator & PasswordValidator
//    let validator: Validator
//    init(validator: Validator) {
//        self.validator = validator
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    func validateFields() {
//        validator.validateEmail()
//        validator.validatePassword()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

protocol Validator {
    func validate()
}

struct EmailValidator: Validator {
    func validate() {
        print("validate email")
    }
}

struct PasswordValidator: Validator {
    func validate() {
        print("validate password")
    }
}

protocol LoginValidator {
    var email: EmailValidator { get }
    var password: PasswordValidator {get }
}

struct LoginViewControllerValidator: LoginValidator {
    var email: EmailValidator {
        return EmailValidator()
    }
    
    var password: PasswordValidator {
        return PasswordValidator()
    }
}

class LoginViewController: UIViewController {
    let validator: LoginValidator
    init(validator: LoginValidator) {
        self.validator = validator
        super.init(nibName: nil, bundle: nil)
    }
    
    func validateFields() {
        validator.email.validate()
        validator.password.validate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let loginViewController = LoginViewController(validator: LoginViewControllerValidator())
loginViewController.validateFields()
