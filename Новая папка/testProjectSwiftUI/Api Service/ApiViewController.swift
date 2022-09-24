//
//  ApiViewController.swift
//  testProjectSwiftUI
//
//  Created by Danil Bochkarev on 23.09.2022.
//

import SwiftUI


class Api {
    
    func getPosts(valueOne:String, selectedColor:String, selectedColor1:String, handler: @escaping (CurrentResult) -> Void) {
        
        let urlString = "https://api.apilayer.com/currency_data/convert?to=\(selectedColor1)&from=\(selectedColor)&amount=\(valueOne)&apikey=D9ChknziARuFqLT43So7jZolLrMB0KYC"
        
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url!) { data, response, error in
            if let data = data {
                if let currentResult = self.parseJSON(withData: data) {
                    handler(currentResult)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentResult? {
        let decoder = JSONDecoder()
        
        do {
            let currentDataApi = try decoder.decode(CurrentDataApi.self, from: data)
            //print(currentDataApi.result)//currentDataApi.result//5724.9702 String
            guard let currentResult = CurrentResult(currentDataApi: currentDataApi)
                else {
                return nil
            }
            return currentResult
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
