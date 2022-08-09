//
//  NetworkService.swift
//  Pryanik
//
//  Created by Mishana on 08.08.2022.
//

import Foundation
import Alamofire


class ApiRequest {
    
    var pryaniky: (([Data]) -> Void)?
    
    var pryanikyData = [Data]() {
        didSet {
            pryaniky?(pryanikyData)
        }
    }
    
    func getData(completion:  @escaping([Data]?) -> Void) {
        
        let url = "https://pryaniky.com/static/json/sample.json"
        
        _ = AF.request(url, method: .get).response { [self] response in
            
            switch response.result {
            case .success(let data):
                guard let recivedData = data,
                      let decodeData = try? JSONDecoder().decode(ModelPryanik.self, from: recivedData) else { return }
                self.pryanikyData = decodeData.view.compactMap{ newPryanik in
                    decodeData.data.first { $0.name == newPryanik }
                }
                completion(pryanikyData)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}

