//
//  ApolloNetwork.swift
//  Countries_Exp
//
//  Created by Shak Feizi on 10/29/21.
//

import Foundation
import Apollo


class NetworkCall {
    // SHAK: Properties
    static let shared: NetworkCall = NetworkCall()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com")!)
    
    private init() {}
    
    // SHAK: Functions
    
}
