//
//  AnimalInfoPage.swift
//  Zoo
//
//  Created by Arshak Vardanov on 23.05.22.
//

import UIKit

class AnimalInfoPage: UIViewController {
    var scrollView: UIScrollView!
    var image: UIImageView!
    var infoLabel: UILabel!
    var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewInit()
        initNameLabel()
        initImage()
        initInfoLabel()
        constructHierarchy()
        activateConstraints()
    }
}
extension AnimalInfoPage {
    func set(value: AnimalsData) {
        infoLabel.text = NSLocalizedString(value.info, comment: "")
        image.image = UIImage(named: value.imageName)
        nameLabel.text = value.name
    }
    func scrollViewInit() {
        scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
    }
    
    func initImage() {
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
    }
    func initNameLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func initInfoLabel() {
        infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func constructHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(image)
        scrollView.addSubview(infoLabel)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            
            image.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 25),
            image.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 20),
            
            infoLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25),
            infoLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 25),
            infoLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -25)
        ])
    }
}
