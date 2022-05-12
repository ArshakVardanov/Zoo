//
//  SecondPage.swift
//  Zoo
//
//  Created by Arshak Vardanov on 12.05.22.
//

import UIKit

class SecondPage: UIViewController {
    
    
    var tableView: UITableView!
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
}
extension SecondPage: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = animalsArray[indexPath.row].titleLabel.text
          return cell
    }
    
    func initTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
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
        view.addSubview(tableView)
        tableView.addSubview(amphibians)
        tableView.addSubview(birds)
        tableView.addSubview(fish)
        tableView.addSubview(mammals)
        tableView.addSubview(reptiles)
    }
}
