//
//  SignUpViewController.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/10.
//

import UIKit

enum SignUpViewControllerType {
    case inputUserName
    case inputUserPassword
}

final class SignUpViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet private weak var NoticeLabel: UILabel!
    @IBOutlet private weak var NoticeDescriptionLabel: UILabel!
    @IBOutlet private weak var userInfoTextField: InstaTextField!
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.isEnabled = false
        }
    }
    
    // MARK: - property
    
    var signUpType: SignUpViewControllerType?
    var signUpViewModel: SignUpViewModel?
    
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetToTextField()
        configUI()
    }
    
    // MARK: - func
    
    private func configUI() {
        switch self.signUpType {
        case .inputUserName:
            NoticeLabel.text = "사용자 이름 만들기"
            NoticeDescriptionLabel.text = "새 계정에 사용할 사용자 이름을 선택하세요.\n나중에 언제든지 변경할 수 있습니다."
            userInfoTextField.placeholder = "사용자 이름"
        case .inputUserPassword:
            NoticeLabel.text = "비밀번호 만들기"
            NoticeDescriptionLabel.text = "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인\n 정보를 입력하지 않아도 됩니다."
            userInfoTextField.placeholder = "비밀번호"
        case .none:
            return
        }
    }
    
    @IBAction private func nextButtonDidTap(_ sender: UIButton) {
        if let signUpType = signUpType {
            signUpViewModel?.nextButtonDidTap(for: signUpType)
        }
    }
    
    private func addTargetToTextField() {
        userInfoTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    private func bindTextFieldOutputToViewModelInput() {
        self.signUpViewModel?.input.userInfo = self.userInfoTextField.text
    }
    
    @objc private func textFieldDidChange(textField: UITextField) {
        nextButton?.isEnabled = userInfoTextField.hasText
        bindTextFieldOutputToViewModelInput()
    }
}
