//
//  SecondPage.swift
//  Zoo
//
//  Created by Arshak Vardanov on 12.05.22.
//

import UIKit

class AnimalChoosingViewController: UIViewController {
    
    
    var stack: UIStackView!
    var amphibians, birds, fish, mammals, reptiles: AnimalsType!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        initStackView()
        initAnimals()
        constructHierarchy()
        activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension AnimalChoosingViewController {
    func initStackView() {
        stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.backgroundColor = .systemGray
    }
    func initAnimals() {
        amphibians = AnimalsType()
        amphibians.translatesAutoresizingMaskIntoConstraints = false
        amphibians.imageView.image = UIImage(named: "amphibians")
        amphibians.titleLabel.text = "Amphibians"
        
        birds = AnimalsType()
        birds.translatesAutoresizingMaskIntoConstraints = false
        birds.imageView.image = UIImage(named: "birds")
        birds.titleLabel.text = "Birds"
        
        fish = AnimalsType()
        fish.translatesAutoresizingMaskIntoConstraints = false
        fish.imageView.image = UIImage(named: "fish")
        fish.titleLabel.text = "Fish"
        
        mammals = AnimalsType()
        mammals.translatesAutoresizingMaskIntoConstraints = false
        mammals.imageView.image = UIImage(named: "mammals")
        mammals.titleLabel.text = "Mammals"
        
        reptiles = AnimalsType()
        reptiles.translatesAutoresizingMaskIntoConstraints = false
        reptiles.imageView.image = UIImage(named: "reptiles")
        reptiles.titleLabel.text = "Reptiles"
        
        
    }
    func activate() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            amphibians.topAnchor.constraint(equalTo: stack.topAnchor, constant: 10),
            amphibians.widthAnchor.constraint(equalToConstant: 200),
            amphibians.heightAnchor.constraint(equalToConstant: 100),
            
            birds.widthAnchor.constraint(equalToConstant: 200),
            birds.heightAnchor.constraint(equalToConstant: 100),
            
            fish.widthAnchor.constraint(equalToConstant: 200),
            fish.heightAnchor.constraint(equalToConstant: 100),
            
            mammals.widthAnchor.constraint(equalToConstant: 200),
            mammals.heightAnchor.constraint(equalToConstant: 100),
            
            reptiles.widthAnchor.constraint(equalToConstant: 200),
            reptiles.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    func constructHierarchy() {
        view.addSubview(stack)
        stack.addArrangedSubview(amphibians)
        stack.addArrangedSubview(birds)
        stack.addArrangedSubview(fish)
        stack.addArrangedSubview(mammals)
        stack.addArrangedSubview(reptiles)
    }
}
