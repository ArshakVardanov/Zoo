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
            AnimalsData.init(name: "Salamander", imageName: "Salamander"),
            AnimalsData.init(name: "Frogs", imageName: "Frogs" ),
            AnimalsData.init(name: "Axolotl", imageName: "Axolotl" )
        ],[
            AnimalsData.init(name: "Owl", imageName: "Owl"),
            AnimalsData.init(name: "Parrots", imageName: "Parrots" ),
            AnimalsData.init(name: "Toucan", imageName: "Toucan" )
        ],[
            AnimalsData.init(name: "Puffer", imageName: "Puffer"),
            AnimalsData.init(name: "Catfish", imageName: "Catfish"),
            AnimalsData.init(name: "Clownfish", imageName: "Clownfish")
        ],[
            AnimalsData.init(name: "Lion", imageName: "Lion"),
            AnimalsData.init(name: "Wolf", imageName: "Wolf"),
            AnimalsData.init(name: "Bear", imageName: "Bear")
        ],[
            AnimalsData.init(name: "Crocodiles", imageName: "Crocodiles"),
            AnimalsData.init(name: "Iguanas", imageName: "Iguanas"),
            AnimalsData.init(name: "Alligators", imageName: "Alligators")
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
}

extension AnimalsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = animalsTabelView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                             for: indexPath) as! AnimalCell
           // Fetch the data for the row.
        cell.data = tableViewData[indexPath.row]
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
