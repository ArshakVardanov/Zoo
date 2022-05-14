//
//  AnimalsType.swift
//  Zoo
//
//  Created by Arshak Vardanov on 12.05.22.
//

import UIKit

struct AnimalsData {
    var name: String
    var image: String
    var id: String
}

class AnimalsType: UIView {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var button: UIButton!
    var id: String!
    
    
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
    
    @objc func buttonPresed(sender: UIButton){
        if let iD = id {print(iD)}
    }
}
extension AnimalsType {
    func set(value: AnimalsData) {
        titleLabel.text = value.name
        imageView.image = UIImage(named: value.image)
        id = value.id
    }
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
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 35)
    }
    func initButton() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPresed), for: .touchUpInside)
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
