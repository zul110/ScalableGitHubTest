//
//  RealmManager_ReposViewModelExtension.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// ReposViewModel extension for Realm operations
extension ReposViewModel {
    // Configure Realm
    func configureRealm() {
        let config = RLMRealmConfiguration.default()
        config.schemaVersion = 1
        config.migrationBlock = {
            (migration, oldSchemaVersion) in
            if (oldSchemaVersion < 1) { }
        }
        
        RLMRealmConfiguration.setDefault(config)
    }
    
    // Initiate Realm objects
    func setupPersistentRepos() {
        DispatchQueue.main.async {
            guard let realm = try? Realm() else {
                return
            }
            
            self.persistentRepos = realm.objects(RepoModel.self)
        }
    }
    
    // Delete data from repos Realm
    func deletePersistentRepos() {
        DispatchQueue.main.async {
            guard let realm = try? Realm() else {
                return
            }
            
            do {
                try realm.write {
                    if let storedRepos = self.persistentRepos, storedRepos.count > 0 {
                        realm.delete(self.persistentRepos)
                    }
                }
            } catch {
                print("Could not delete repos")
            }
        }
    }
    
    // Acquire new data via network call
    func updatePersistentRepos() {
        self.deletePersistentRepos()
        self.getData()
    }
}
