//
//  CountryDetailView.swift
//  Countries_Exp
//
//  Created by Shak Feizi on 10/29/21.
//

import SwiftUI

struct CountryDetailView: View {
    let country: GetAllCountriesQuery.Data.Country
    @State private var countryInfo: GetCountryInfoQuery.Data.Country?
    
    var body: some View {
        VStack {
            HStack {
                Text(countryInfo?.emoji ?? "")
                    .scaleEffect(3)
                    .padding(15)
                VStack() {
                    Text(countryInfo?.name ?? "")
                    Text(countryInfo?.capital ?? "")
                }
            }
            List(countryInfo?.states ?? [], id: \.name) { state in
                Text(state.name)
            }
        }
        .onAppear(perform: {
            NetworkCall.shared.apollo.fetch(query: GetCountryInfoQuery(code: country.code)) { result in
                switch result {
                case .success(let infoForCountry):
                    DispatchQueue.main.async {
                        self.countryInfo = infoForCountry.data?.country
                    }
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: GetAllCountriesQuery.Data.Country(name: "USA", capital: "", emoji: "", code: "US"))
    }
}
