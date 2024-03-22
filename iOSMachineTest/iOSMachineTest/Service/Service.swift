//
//  Service.swift
//  iOSMachineTest
//
//  Created by Mc on 20/03/24.
//

import Foundation
import Alamofire

protocol IteamListServiceDelegate: AnyObject {
    func productSuccessResponse(_ response: GroupResponse) // Change the response type
    func productFailResponse()
}

class IteamListService {
    weak var delegate: IteamListServiceDelegate?
}

extension IteamListService {
    // MARK: get All Movie Categories list data
    
    func getAllMoviewCategories() {
        let url = URL(string: "http://huddle-dev.messej.com/huddles/podium_dummy")!
        AF.request(url, method: .get)
            .responseDecodable(of: GroupResponse.self) { response in // Change the response type
                switch response.result {
                case .success(let value):
                    // Handle successful decoding of JSON response
                    self.delegate?.productSuccessResponse(value) // Pass the entire GroupResponse
                case .failure(let error):
                    // Handle failure
                    self.delegate?.productFailResponse()
                    print("error\(error)")
                }
            }
    }
}
