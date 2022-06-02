//
//  AnimalInfoViewController.swift
//  Zoo
//
//  Created by Arshak Vardanov on 23.05.22.
//

import UIKit

class AnimalInfoViewController: UIViewController {
    var animalImageView: UIImageView!
    var infoLabel: UILabel!
    var nameLabel: UILabel!
    var id: Int!
    var data: AnimalsData!
    
    init(data: AnimalsData) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollViewInit()
        initNameLabel()
        initImage()
        initInfoLabel()
        constructHierarchy()
        activateConstraints()
        view.backgroundColor = .white
    }
}
extension AnimalInfoViewController {
//    func scrollViewInit() {
//        view = UIScrollView()
//        view.frame = view.bounds
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.showsVerticalScrollIndicator = true
//    }
    
    func initImage() {
        animalImageView = UIImageView()
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        animalImageView.image = UIImage(named: data.imageName)
        animalImageView.clipsToBounds = true
        animalImageView.contentMode = .scaleAspectFill
    }
    
    func initNameLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = NSLocalizedString(data.name, comment: "")
        nameLabel.font = .systemFont(ofSize: 20)
    }
    
    func initInfoLabel() {
        infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.text = NSLocalizedString(data.info, comment: "")
    }
    
    func constructHierarchy() {
        view.addSubview(nameLabel)
        view.addSubview(animalImageView)
        view.addSubview(infoLabel)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            
            animalImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
            animalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animalImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animalImageView.heightAnchor.constraint(equalToConstant: 200),
            
            infoLabel.topAnchor.constraint(equalTo: animalImageView.bottomAnchor, constant: 25),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }
}
