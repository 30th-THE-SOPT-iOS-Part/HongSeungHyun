//
//  GreetingViewController.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/10.
//

import UIKit

final class GreetingViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var greetingLabel: UILabel!
    
    // MARK: - property
    
    var greetingViewModel: GreetingViewModel?
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.greetingViewModel?.disposeObservable()
    }
    
    // MARK: - func
    
    @IBAction private func completeButtonDidTap(_ sender: UIButton) {
        greetingViewModel?.completeButtonDidTap()
    }
    
    @MainActor private func bindViewModel() {
        self.greetingViewModel?.output.$userIdentifier.bind(fire: true) { (value) in
            self.greetingLabel.text = "\(value)님, Instagram에\n 오신 것을 환영합니다."
        }
    }
}
