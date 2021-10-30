//
//  CountryListVM.swift
//  Countries_Exp
//
//  Created by Shak Feizi on 10/29/21.
//

import Foundation


class CountryListVM: ObservableObject {
    // SHAK: Properties
    @Published var countries: [GetAllCountriesQuery.Data.Country] = []
    
    // SHAK: Functions
    func fetchInfo() {
        NetworkCall.shared.apollo.fetch(query: GetAllCountriesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let countries = graphQLResult.data?.countries {
                    DispatchQueue.main.async {
                        self.countries = countries
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
