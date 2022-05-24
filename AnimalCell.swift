//
//  AnimalCell.swift
//  Zoo
//
//  Created by Arshak Vardanov on 21.05.22.
//
import UIKit
struct AnimalsData {
    var name: String
    var imageName: String
    var info: String
    var id: Int
}

class AnimalCell: UITableViewCell {
    var image: UIImageView!
    var nameLabel: UILabel!
    var animalButton: UIButton!
    var data: AnimalsData? {
        didSet {
            guard let data = data else { return }
            image.image = UIImage(named: data.imageName)
            nameLabel.text = NSLocalizedString(data.name, comment: "")
            animalButton.tag = data.id
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnimalCell {
    func commonInit() {
        initButton()
        initImageView()
        initLabel()
        constructHierarchy()
        activateConstraints()
    }
    
    func initImageView() {
        image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
    }
    
    func initLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 20)
    }
    
    func initButton() {
        animalButton = UIButton()
        animalButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        addSubview(animalButton)
        animalButton.addSubview(image)
        animalButton.addSubview(nameLabel)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            animalButton.topAnchor.constraint(equalTo: self.topAnchor),
            animalButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            animalButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            animalButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 30),
        ])
    }
}
