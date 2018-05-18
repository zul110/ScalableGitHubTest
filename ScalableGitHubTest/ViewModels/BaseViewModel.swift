//
//  BaseViewModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func didGetDataSuccessfully()
    func didFailGettingData(_ error: ErrorModel)
}

class BaseViewModel {
    var apiToUse = ""
    
    var isLoading: Bool! = false
    var hasError: Bool! = false
    var error: ErrorModel!
    
    func getGetResponse(_ api: String, parameters: [String], success: @escaping (_ responseData: Data) -> Void, failure: @escaping (_ responseData: Data, _ statusCode: Int) -> Void) {
        self.apiToUse = api
        self.isLoading = true
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string: api)!) {
            data, response, error in
            
            self.isLoading = false
            
            guard error == nil else {
                self.error = ErrorModel(errorType: .network, statusCode: 0, message: error!.localizedDescription)
                
                self.hasError = true
                
                return
            }
            
            guard let responseData = data else {
                self.error = ErrorModel(errorType: .data, statusCode: 0, message: "Empty response.")
                
                self.hasError = true
                
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 && httpResponse.statusCode != 201 {
                    self.error = ErrorModel(errorType: .network, statusCode: httpResponse.statusCode, message: String(data: responseData, encoding: .utf8)!)
                    
                    failure(responseData, httpResponse.statusCode)
                    
                    self.hasError = true
                } else {
                    self.hasError = false
                    success(responseData)
                }
            }
        }
        
        task.resume()
    }
    
    // MARK: Abstract Functions
    func getData() {
        preconditionFailure("Abstract function: BaseViewModel.getData()")
    }
    
    func displayData() {
        preconditionFailure("Abstract function: BaseViewModel.displayData()")
    }
    
    func success(responseData: Data) {
        preconditionFailure("Abstract function: BaseViewModel.success(response:)")
    }
    
    func failure(responseData: Data, statusCode: Int) {
        preconditionFailure("Abstract function: BaseViewModel.failure(response:)")
    }
}
