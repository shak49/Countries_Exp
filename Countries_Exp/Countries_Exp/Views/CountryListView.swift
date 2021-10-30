//
//  ContentView.swift
//  Countries_Exp
//
//  Created by Shak Feizi on 10/29/21.
//

import SwiftUI


struct CountryListView: View {
    @StateObject private var countryListVM: CountryListVM = CountryListVM()
    
    var body: some View {
        NavigationView {
            VStack {
                List(countryListVM.countries, id: \.code) { country in
                    NavigationLink(destination: CountryDetailView(country: country), label: {
                        HStack {
                            Text(country.emoji)
                            Text(country.name)
                        }
                    })
                }
                .listStyle(PlainListStyle())
            }
            .onAppear(perform: {
                countryListVM.fetchInfo()
            })
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
