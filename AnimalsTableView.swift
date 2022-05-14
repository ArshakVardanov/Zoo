//
//  AnimalsTableView.swift
//  Zoo
//
//  Created by Arshak Vardanov on 13.05.22.
//

import UIKit

class AnimalsTableView: UIViewController, UITableViewDelegate {
    let tableViewData = Array(repeating: "Item", count: 5)
    var animalsTabelView: UITableView!
    var animal: AnimalsData!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        initAnimalsTabel()
        constructHierarchy()
        activateConstraints()
        animalsTabelView.register(UITableViewCell.self,
                               forCellReuseIdentifier: "TableViewCell")
        
        animalsTabelView.dataSource = self
        animalsTabelView.delegate = self
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnimalsTableView: UITableViewDataSource {
    func set(value: AnimalsData) {
        animal = value
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = animalsTabelView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                     for: indexPath)
            cell.textLabel?.text = self.tableViewData[indexPath.row]
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
