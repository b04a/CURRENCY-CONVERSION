//
//  CurrentResult.swift
//  testProjectSwiftUI
//
//  Created by Danil Bochkarev on 23.09.2022.
//

import Foundation


struct CurrentResult {
    let suka : String
    
    init?(currentDataApi: CurrentDataApi) {
        suka = String((currentDataApi.result).rounded())
    }
}
