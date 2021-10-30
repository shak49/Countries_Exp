//
//  CountryDetailVM.swift
//  Countries_Exp
//
//  Created by Shak Feizi on 10/29/21.
//

import Foundation


//class CountryDetailVM: ObservableObject {
//    // SHAK: Properties
//    @Published var country: GetAllCountriesQuery.Data.Country!
//    @Published var countryInfo: GetCountryInfoQuery.Data.Country?
//    
//    // SHAK: Functions
//    func fetchDetail() {
//        NetworkCall.shared.apollo.fetch(query: GetCountryInfoQuery(code: country.code)) { result in
//            switch result {
//            case .success(let infoForCountry):
//                DispatchQueue.main.async {
//                    self.countryInfo = infoForCountry.data?.country
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
