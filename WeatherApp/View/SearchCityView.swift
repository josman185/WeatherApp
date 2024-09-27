//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/26/24.
//

import SwiftUI

struct SearchCityView: View {
    
    @ObservedObject var viewModel = SearchCityViewModel()
    @State var city = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter city", text: $city)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 1.0)
                    )
                    .padding()
                Button(action: {
                    viewModel.getWeatherDatabyCity(name: city)
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
            }
            .padding([.trailing])
            
            List(viewModel.cities) { city in
                CityCell(city: city)
            }
        }
    }
}

//#Preview {
//    SearchCityView()
//}
