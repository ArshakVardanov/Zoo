//
//  AnimalsType.swift
//  Zoo
//
//  Created by Arshak Vardanov on 12.05.22.
//

import UIKit

struct AnimalsTypeData {
    var name: String
    var image: String
    var id: Int
}

class AnimalsType: UIView {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var button: UIButton!
    var id: Int!
    
    
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
    func set(value: AnimalsTypeData) {
        titleLabel.text = NSLocalizedString(value.name, comment: "")
        imageView.image = UIImage(named: value.image)
        id = value.id
    }
    func initImageView() {
        imageView = UIImageView()
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initLabel() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20)
    }
    func initButton() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPresed), for: .touchUpInside)
    }
    func constructHierarchy() {
        addSubview(button)
        button.addSubview(titleLabel)
        button.addSubview(imageView)
    }
    func activateConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
