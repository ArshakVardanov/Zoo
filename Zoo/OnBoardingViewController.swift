//
//  ViewController.swift
//  Zoo
//
//  Created by Arshak Vardanov on 10.05.22.
//

import UIKit

class OnBoardingViewController: UIViewController {
    var titleLabel: UILabel!
    var picker: UIPickerView!
    var button: UIButton!
    var pickerData = ["Armenian", "Russion", "English"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initLabel()
        initPicker()
        initButton()
        constructHierarchy()
        activateConstraints()
        button.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func getStarted(sender: UIButton){
        let viewController = AnimalChoosingViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
extension OnBoardingViewController {
    
    func initLabel() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Welcome Zoo"
        titleLabel.font = .systemFont(ofSize: 20)
    }
    
    func initPicker() {
        picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
    }
    
    func initButton() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 12
        button.tag = 1
    }
    
    func constructHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(picker)
        view.addSubview(button)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            picker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 25)
        ])
    }
}

extension OnBoardingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int
    ) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
}
