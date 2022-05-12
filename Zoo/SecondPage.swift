//
//  SecondPage.swift
//  Zoo
//
//  Created by Arshak Vardanov on 12.05.22.
//

import UIKit

class SecondPage: UIViewController {
    
    
    var stack: UIStackView!
    var amphibians, birds, fish, mammals, reptiles: AnimalsType!
    var animalsArray: [AnimalsType] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
        initTableView()
        initAnimals()
        constructHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func getStarted(sender: UIButton){
        initTableView()
    }
}
extension SecondPage {
    func initTableView() {
        stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
    }
    func initAnimals() {
        amphibians = AnimalsType()
        amphibians.translatesAutoresizingMaskIntoConstraints = false
        amphibians.imageView.image = UIImage(named: "amphibians")
        animalsArray += [amphibians]
        
        birds = AnimalsType()
        birds.translatesAutoresizingMaskIntoConstraints = false
        birds.imageView.image = UIImage(named: "birds")
        animalsArray += [birds]
        
        fish = AnimalsType()
        fish.translatesAutoresizingMaskIntoConstraints = false
        fish.imageView.image = UIImage(named: "fish")
        animalsArray += [fish]
        
        mammals = AnimalsType()
        mammals.translatesAutoresizingMaskIntoConstraints = false
        mammals.imageView.image = UIImage(named: "mammals")
        animalsArray += [mammals]
        
        reptiles = AnimalsType()
        reptiles.translatesAutoresizingMaskIntoConstraints = false
        reptiles.imageView.image = UIImage(named: "reptiles")
        animalsArray += [reptiles]
        
        
    }
    
    func constructHierarchy() {
        view.addSubview(stack)
        stack.addSubview(amphibians)
        stack.addSubview(birds)
        stack.addSubview(fish)
        stack.addSubview(mammals)
        stack.addSubview(reptiles)
    }
}
