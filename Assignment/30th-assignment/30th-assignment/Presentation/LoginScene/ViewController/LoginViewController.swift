//
//  ViewController.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/08.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBoutlet
    
    @IBOutlet private var userIdentifierTextField: InstaTextField!
    @IBOutlet private var userPasswordTextField: InstaTextField!
    @IBOutlet private var loginButton: UIButton! {
        didSet {
            loginButton.isEnabled = false
        }
    }
    
    // MARK: - property
    
    var loginViewModel: LoginViewModel?
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetToTextField()
    }
    
    // MARK: - func
    
    @IBAction private func loginButtonDidTap(_ sender: UIButton) {
        self.loginViewModel?.loginButtonDidTap()
    }
    
    @IBAction private func signUpButtonDidTap(_ sender: UIButton) {
        self.loginViewModel?.signUpButtonDidTap()
    }
    
    private func bindTextFieldOutputToViewModelInput() {
        self.loginViewModel?.input.userIdentifier = userIdentifierTextField.text
        self.loginViewModel?.input.userPassword = userPasswordTextField.text
    }
    
    private func addTargetToTextField() {
        [userIdentifierTextField, userPasswordTextField].forEach {
            $0?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        }
    }
    
    @objc private func textFieldDidChange(textField: UITextField) {
        let isAllTextFieldsHasText = [userIdentifierTextField, userPasswordTextField].allSatisfy { $0.hasText }
        loginButton?.isEnabled = isAllTextFieldsHasText
        bindTextFieldOutputToViewModelInput()
    }
}
