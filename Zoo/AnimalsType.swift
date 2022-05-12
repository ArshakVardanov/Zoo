//
//  AnimalsType.swift
//  Zoo
//
//  Created by Arshak Vardanov on 12.05.22.
//

import UIKit

class AnimalsType: UIView {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var button: UIButton!
    
    init() {
        super.init(frame: .zero)
        
        initImageView()
        initButton()
        initLabel()
        constructHierarchy()
        activateConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension AnimalsType {
    func initImageView() {
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initLabel() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 25)
    }
    func initButton() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    func constructHierarchy() {
        addSubview(imageView)
        imageView.addSubview(button)
        button.addSubview(titleLabel)
    }
    func activateConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            button.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
    }
}
