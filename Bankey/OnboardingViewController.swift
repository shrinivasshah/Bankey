//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Shrinivas Shah on 24/03/23.
//

import Foundation
import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView();
    let imageView = UIImageView();
    let label = UILabel();
    
    var heroImageName: String?;
    var imageDescription: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        style()
        layout()
    }
    
    init(withImageName imageName: String, description: String){
        self.heroImageName = imageName;
        self.imageDescription = description;
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}

extension OnboardingViewController {
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical;
        stackView.spacing = 20;
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.textAlignment = .center;
        label.font = UIFont.preferredFont(forTextStyle: .title1);
        label.adjustsFontForContentSizeCategory = true;
        label.numberOfLines = 0;
        label.text = imageDescription;
        
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.contentMode = .scaleAspectFit;
        imageView.image = UIImage(named: heroImageName ?? "delorean")
        
    }
    
    func layout() {
        view.addSubview(stackView);
        stackView.addArrangedSubview(imageView);
        stackView.addArrangedSubview(label);
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}

