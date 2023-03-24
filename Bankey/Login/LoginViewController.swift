//
//  ViewController.swift
//  Bankey
//
//  Created by Shrinivas Shah on 23/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView();
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let titleLabel = UILabel();
    let descriptionLabel = UILabel();
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false;
        
        // sign in button
        signInButton.translatesAutoresizingMaskIntoConstraints = false;
        signInButton.configuration = .filled();
        signInButton.configuration?.imagePadding = 8;
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        // error label
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false;
        errorMessageLabel.textAlignment = .center;
        errorMessageLabel.textColor = .systemRed;
        errorMessageLabel.numberOfLines = 0;
        errorMessageLabel.isHidden = true;
       
        // titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        titleLabel.textColor = .black;
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        titleLabel.text = "Brethe Air"
        titleLabel.textAlignment = .center;
        
        // descriptionLabel
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false;
        descriptionLabel.textColor = .black;
        descriptionLabel.font.withSize(24);
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.textAlignment = .center;
        descriptionLabel.text = "What colour is your bugatti"
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        
        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1)
        ])
        
        
        // description Label
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 1)
        ])
        
        
        // login view
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 2),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        // sign in button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    
        // error message label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}

//MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
                    
            login()
        
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password cannot be blank")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "welcome" {
            signInButton.configuration?.showsActivityIndicator = true;
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false;
        errorMessageLabel.text = message;
    }
}
