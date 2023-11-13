//
//  Storage.swift
//  ToDoList
//
//  Created by Слава Васильев on 30.10.2023.
//

import Foundation

protocol StorgeManagerProtocol {
    func set(_ object: Any?, forKey key: StorgeManager.Keys)
    
    func string(forKey key: StorgeManager.Keys ) -> String?
    func dict(forKey key: StorgeManager.Keys) -> [String]?
    func remove(forKey key: StorgeManager.Keys)
    
}


final class StorgeManager {
    
    public enum Keys: String {
        case task
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    private func reStore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
    
}

extension StorgeManager: StorgeManagerProtocol{
    
    func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    func string(forKey key: Keys) -> String? {
        reStore(forKey: key.rawValue) as? String
    }
    
    func dict(forKey key: Keys) -> [String]? {
        reStore(forKey: key.rawValue) as? [String]? ?? []
    }
    func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
    
}
