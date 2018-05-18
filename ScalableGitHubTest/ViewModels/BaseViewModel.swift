//
//  BaseViewModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

// Common protocol for all ViewModels
protocol ViewModelDelegate: class {
    func didGetDataSuccessfully()
    func didFailGettingData(_ error: ErrorModel)
}

// The BASE ViewModel; The core of all ViewModels in this application
// Responsible for managing network connections, acquiring data, and notifiying of success or error
// Can also include error handling, depending on the scope of the application
class BaseViewModel {
    // MARK: Properties
    var apiToUse = ""                   // The API to use for the call. Accessible to the whole ViewModel
    
    var isLoading: Bool! = false        // Whether the request is in progress or not
    var hasError: Bool! = false         // Whether the request has an error or not
    var error: ErrorModel!              // The custom error to be passed on to the caller
    
    // MARK: Functions
    
    // Gets the HTTP GET response successfully, or notifies of failure
    func getGetResponse(_ api: String, parameters: [String], success: @escaping (_ responseData: Data) -> Void, failure: @escaping (_ error: ErrorModel, _ responseData: Data?, _ statusCode: Int) -> Void) {
        self.isLoading = true
        
        // URL Session with default configurations
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string: api)!) {
            data, response, error in
            
            self.isLoading = false
            
            // If there is an error, create an ErrorModel, and go to the failure block
            guard error == nil else {
                self.error = ErrorModel(errorType: .network, statusCode: 0, message: error!.localizedDescription)
                
                failure(self.error, nil, 0)
                
                self.hasError = true
                
                return
            }
            
            // If there is an error regarding the data (eg: empty response),
            // create an ErrorModel, and go to the failure block
            guard let responseData = data else {
                self.error = ErrorModel(errorType: .data, statusCode: 0, message: "Empty response.")
                
                failure(self.error, nil, 0)
                
                self.hasError = true
                
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                // If the HTTP status code of the response is neither OK (200), or Created (201),
                // response with a failure
                // Else, post success
                if httpResponse.statusCode != 200 && httpResponse.statusCode != 201 {
                    self.error = ErrorModel(errorType: .network, statusCode: httpResponse.statusCode, message: String(data: responseData, encoding: .utf8)!)
                    
                    failure(self.error, responseData, httpResponse.statusCode)
                    
                    self.hasError = true
                } else {
                    self.hasError = false
                    success(responseData)
                }
            }
        }
        
        // Initiate the URL Session task
        task.resume()
    }
    
    // MARK: Abstract Functions
    
    // App crashes if these functions are not implemented in the derived ViewModels
    func getData() {
        preconditionFailure("Abstract function: BaseViewModel.getData()")
    }
    
    func displayData() {
        preconditionFailure("Abstract function: BaseViewModel.displayData()")
    }
    
    func success(responseData: Data) {
        preconditionFailure("Abstract function: BaseViewModel.success(response:)")
    }
    
    func failure(error: ErrorModel, responseData: Data, statusCode: Int) {
        preconditionFailure("Abstract function: BaseViewModel.failure(response:)")
    }
}
