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
}

class AnimalCell: UITableViewCell {
    var image: UIImageView!
    var nameLabel: UILabel!
    var data: AnimalsData? {
        didSet {
            guard let data = data else { return }
            image.image = UIImage(named: data.imageName)
            nameLabel.text = NSLocalizedString(data.name, comment: "")
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
    
    func constructHierarchy() {
        addSubview(image)
        addSubview(nameLabel)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
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
