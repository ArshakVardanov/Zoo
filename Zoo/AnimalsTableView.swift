//
//  AnimalsTableView.swift
//  Zoo
//
//  Created by Arshak Vardanov on 13.05.22.
//

import UIKit

class AnimalsTableView: UIViewController, UITableViewDelegate {
    
    var animalsData: [[AnimalsData]] = [
        [
            AnimalsData.init(name: "Salamander", imageName: "Salamander", info: "Salamander", id: 1),
            AnimalsData.init(name: "Frogs", imageName: "Frogs" , info: "Frogs", id: 2),
            AnimalsData.init(name: "Axolotl", imageName: "Axolotl", info:"Axolotl", id: 3 )
        ],[
            AnimalsData.init(name: "Owl", imageName: "Owl", info:"", id: 1),
            AnimalsData.init(name: "Parrots", imageName: "Parrots" ,info: "", id: 2),
            AnimalsData.init(name: "Toucan", imageName: "Toucan", info:"", id: 3 )
        ],[
            AnimalsData.init(name: "Puffer", imageName: "Puffer", info:"", id: 1),
            AnimalsData.init(name: "Catfish", imageName: "Catfish", info:"", id: 2),
            AnimalsData.init(name: "Clownfish", imageName: "Clownfish", info:"", id: 3)
        ],[
            AnimalsData.init(name: "Lion", imageName: "Lion", info:"", id: 1),
            AnimalsData.init(name: "Wolf", imageName: "Wolf", info:"", id: 2),
            AnimalsData.init(name: "Bear", imageName: "Bear", info:"", id: 3)
        ],[
            AnimalsData.init(name: "Crocodiles", imageName: "Crocodiles", info:"", id: 1),
            AnimalsData.init(name: "Iguanas", imageName: "Iguanas", info:"", id: 2),
            AnimalsData.init(name: "Alligators", imageName: "Alligators", info:"", id: 3)
        ]
    ]
    
    var tableViewData: [AnimalsData]!
    var animalsTabelView: UITableView!
    
    init(animalTypeID: Int) {
        super.init(nibName: nil, bundle: nil)
        tableViewData = animalsData[animalTypeID - 1]
        view.backgroundColor = .white
        initAnimalsTabel()
        constructHierarchy()
        activateConstraints()
        animalsTabelView.register(AnimalCell.self, forCellReuseIdentifier: "TableViewCell")
        
        animalsTabelView.dataSource = self
        animalsTabelView.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func animalPresed(sender: UIButton){
        let viewController = AnimalInfoPage()
        viewController.set(value: tableViewData[sender.tag - 1])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AnimalsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrail = tableViewData[indexPath.row]
        
        if let viewController = storyboard?.instantiateViewController(identifier: "TrailViewController") as? AnimalInfoPage {
            viewController.set(value: selectedTrail)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = animalsTabelView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                             for: indexPath) as! AnimalCell
           // Fetch the data for the row.
        cell.data = tableViewData[indexPath.row]
//        cell.animalButton.addTarget(self, action: #selector(animalPresed), for: .touchUpInside)
           // Configure the cell’s contents with data from the fetched object.        
       return cell
    }
    func initAnimalsTabel() {
        animalsTabelView = UITableView()
        animalsTabelView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        view.addSubview(animalsTabelView)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            animalsTabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animalsTabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animalsTabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animalsTabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
