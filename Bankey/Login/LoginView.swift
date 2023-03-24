//
//  LoginView.swift
//  Bankey
//
//  Created by Shrinivas Shah on 23/03/23.
//

import Foundation
import UIKit
class LoginView: UIView {
    let stackView = UIStackView();
    let usernameTextField = UITextField();
    let passwordTextField = UITextField();
    let dividerView = UIView();
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - Username TextField

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false;
        backgroundColor = .secondarySystemBackground
        
        // stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical;
        stackView.spacing = 8;
        
        // username textfield
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false;
        usernameTextField.placeholder = "Username";
        usernameTextField.delegate = self
        
        // password textfield
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false;
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true;
        passwordTextField.delegate = self
        
        // divider view
        dividerView.translatesAutoresizingMaskIntoConstraints = false;
        dividerView.backgroundColor = .secondarySystemFill
        
        // self
        layer.cornerRadius = 5;
        clipsToBounds = true

    }
    
    func layout() {
        addSubview(stackView)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
       
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor , multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true;
    }
}


extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true);
        passwordTextField.endEditing(true)
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
    }
}
