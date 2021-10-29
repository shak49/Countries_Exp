//
//  ContentView.swift
//  Countries_Exp
//
//  Created by Shak Feizi on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries: [GetAllCountriesQuery.Data.Country] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(countries, id: \.code) { country in
                    HStack {
                        Text(country.emoji)
                        Text(country.name)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .onAppear(perform: {
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
            })
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
