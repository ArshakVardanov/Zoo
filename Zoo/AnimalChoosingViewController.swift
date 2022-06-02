//
//  SecondPage.swift
//  Zoo
//
//  Created by Arshak Vardanov on 12.05.22.
//

import UIKit

protocol AnimalDataDelegate {
//    var name: String {get set}
//    var imageName: String {get set}
//    var id: Int {get set}
    
    func didButtonSelected(with data: AnimalsTypeData)
}

class AnimalChoosingViewController: UIViewController, AnimalDataDelegate {
    func didButtonSelected(with data: AnimalsTypeData) {
        let viewController = AnimalsTableView(animalTypeID: data.id)
                    navigationController?.pushViewController(viewController, animated: true)
    }
    
    var delegate: AnimalDataDelegate?
    var stack: UIStackView!
    var animalsTypeData: [AnimalsTypeData] = [
        AnimalsTypeData.init(name: "Amphibians", image: "amphibians", id: 1),
        AnimalsTypeData.init(name: "Birds", image: "birds", id: 2),
        AnimalsTypeData.init(name: "Fish", image: "fish", id: 3),
        AnimalsTypeData.init(name: "Mammals", image: "mammals", id: 4),
        AnimalsTypeData.init(name: "Reptiles", image: "reptiles", id: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.backgroundColor = .white
        initStackView()
        initAnimals()
        constructHierarchy()
        activateConstraint()
        // Do any additional setup after loading the view.
        
        title = NSLocalizedString("animalType_title", comment: "")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .plain,
            target: self,
            action: #selector(gearButtonPressed))
    }
    
    @objc func gearButtonPressed() {
        UIApplication.shared.open(URL(string:
                                        UIApplication.openSettingsURLString)!)
    }
    
    func initAnimals() {
        for item in animalsTypeData {
            let animal = AnimalsTypeView()
            animal.translatesAutoresizingMaskIntoConstraints = false
            animal.set(data: item)
            animal.delegate = self
            stack.addArrangedSubview(animal)
            NSLayoutConstraint.activate([
                animal.imageView.widthAnchor.constraint(equalToConstant: (view.frame.width)),
                animal.imageView.heightAnchor.constraint(equalToConstant: (view.frame.height)/7)
            ])

        }
    }
}
extension AnimalChoosingViewController {
    func initStackView() {
        stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .systemCyan
    }
        
    func activateConstraint() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func constructHierarchy() {
        view.addSubview(stack)
    }
}
