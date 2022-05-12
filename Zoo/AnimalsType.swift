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
        
//        self.backgroundColor = .
        initImageView()
        initButton()
        initLabel()
        constructHierarchy()
        activateConstraints()
        button.addTarget(self, action: #selector(buttonPresed), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPresed(sender: UIButton){
        if button.tag == 1{
            sender.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            button.tag = 0
        } else {
            sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            button.tag = 1

        }
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
        titleLabel.textColor = .systemGreen
        titleLabel.font = .systemFont(ofSize: 35)
    }
    func initButton() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
    }
    func constructHierarchy() {
        addSubview(button)
        button.addSubview(imageView)
        button.addSubview(titleLabel)
    }
    func activateConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: button.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
    }
}
