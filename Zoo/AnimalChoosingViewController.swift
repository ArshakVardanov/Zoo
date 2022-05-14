//
//  SecondPage.swift
//  Zoo
//
//  Created by Arshak Vardanov on 12.05.22.
//

import UIKit

class AnimalChoosingViewController: UIViewController {
    
    var stack: UIStackView!
    var scrollView: UIScrollView!
    
    var animalsData: [AnimalsData] = [
        AnimalsData.init(
            name: "amphibians",
            image: "amphibians",
            id: "01"
        ),
        AnimalsData.init(
            name: "birds",
            image: "birds",
            id: "02"
        ),
        AnimalsData.init(
            name: "fish",
            image: "fish",
            id: "03"
        ),
        AnimalsData.init(
            name: "mammals",
            image: "mammals",
            id: "04"
        ),
        AnimalsData.init(
            name: "reptiles",
            image: "reptiles",
            id: "05"
        )
    ]
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        initScrol()
        initStackView()
        initAnimals()
        constructHierarchy()
        activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initAnimals() {
        for item in animalsData {
            let animal = AnimalsType()
            animal.translatesAutoresizingMaskIntoConstraints = false
            animal.set(value: item)
            animal.button.addTarget(self, action: #selector(buttonPresed), for: .touchUpInside)
            stack.addArrangedSubview(animal)
            
            NSLayoutConstraint.activate([
                animal.widthAnchor.constraint(equalToConstant: view.frame.width),
                animal.heightAnchor.constraint(equalToConstant: (view.frame.height)/4)
            ])

        }
    }
    
    @objc func buttonPresed(sender: UIButton){
        sender.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
        let viewController = AnimalsTableView()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
extension AnimalChoosingViewController {
    func initStackView() {
        stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.axis = .vertical
        stack.backgroundColor = .systemGray
    }
    func initScrol() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func activate() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 1000),
            
            stack.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ])
    }
    
    func constructHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stack)
    }
}
