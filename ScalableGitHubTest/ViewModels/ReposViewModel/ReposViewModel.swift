//
//  ReposViewModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ReposViewModel: BaseViewModel {
    var repos: [RepoModel] = []
    var persistentRepos: Results<RepoModel>!
    
    var delegate: ViewModelDelegate!
    
    override init() {
        super.init()
        
        self.apiToUse = API.REPOS
        
        self.configureRealm()
        self.setupPersistentRepos()
    }
    
    override func getData() {
        DispatchQueue.main.async {
            if let storedRepos = self.persistentRepos, storedRepos.count > 0 {
                print("Restoring from persistent storage")
                
                self.repos = storedRepos.map { $0 }
                self.delegate.didGetDataSuccessfully()
            } else {
                print("Getting remote response")
                
                self.deletePersistentRepos()
                
                self.getGetResponse(self.apiToUse, parameters: [], success: self.success, failure: self.failure)
            }
        }
    }
    
    override func success(responseData: Data) {
        print("SUCCESS REPOS")
        
        guard let repos = try? JSONDecoder().decode(Array<RepoModel>.self, from: responseData) else {
            print("Error: Couldn't decode data into Repos")
            return
        }
        
        self.repos = repos
            .map {
                (repo: RepoModel) -> RepoModel in
                DispatchQueue.main.async {
                    guard let realm = try? Realm() else {
                        return
                    }
                    
                    do {
                        try realm.write {
                            realm.add(repo)
                        }
                    } catch {
                        print("Could not wirte \((repo.name)!) into Realm")
                    }
                }
                
                return repo
        }
        
        self.delegate.didGetDataSuccessfully()
        
        self.displayData()
    }
    
    override func failure(responseData: Data, statusCode: Int) {
        print("REPOS VM FAILED \(statusCode)")
        
        self.delegate.didFailGettingData(self.error)
    }
    
    override func displayData() {
        DispatchQueue.main.async {
            print((self.repos[0].owner?.login)!)
        }
    }
}
