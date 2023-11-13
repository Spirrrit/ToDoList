//
//  AddTaskVC.swift
//  ToDoList
//
//  Created by Слава Васильев on 30.10.2023.
//

import UIKit

class AddTaskVC: UIViewController {

    private let storage: StorgeManagerProtocol = StorgeManager()
    
//    var items = [String]()
    
    let textField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .systemGray6
        field.placeholder = "Add new task"
        field.textAlignment = .center
        field.layer.cornerRadius = 15
        return field
    }()
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
//        items = storage.dict(forKey: .task) ?? []
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeButtonAction))
        title = "Add new task"
        
        addView()
        
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    }
    
    @objc func closeButtonAction(){
        navigationController?.popViewController(animated: true)
    }
    @objc func addButtonAction(){
        
        if let text = textField.text , !text.isEmpty {
            
            var currentItem = storage.dict(forKey: .task) ?? []
            currentItem.append(text)
            storage.set(currentItem, forKey: .task)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    func addView(){
        view.addSubview(textField)
        view.addSubview(addButton)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            addButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }


    
}
