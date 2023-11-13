//
//  ViewController.swift
//  ToDoList
//
//  Created by Слава Васильев on 30.10.2023.
//

import UIKit

class MainVC: UIViewController {

    private let storage: StorgeManagerProtocol = StorgeManager()
    
    var items = [String]()
    
    let tableVew: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableVew)
        tableVew.frame = view.bounds
        tableVew.dataSource = self
        view.backgroundColor = .white
        title = "To Do List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        items = storage.dict(forKey: .task) ?? []
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        items = storage.dict(forKey: .task) ?? []
        tableVew.reloadData()
    }
    
    @objc func addButton(){
        
        navigationController?.pushViewController(AddTaskVC(), animated: true)
    }


}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        storage.set(items, forKey: .task)
        
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
}
