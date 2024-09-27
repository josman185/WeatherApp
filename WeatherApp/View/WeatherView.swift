//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/25/24.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city = ""
    
    var body: some View {
        VStack {
            Text(viewModel.cityName ?? "")
                .font(.largeTitle)
                .padding()
            Text(viewModel.temperature ?? "")
                .font(.system(size: 70))
            Text("\(viewModel.weatherIcon)")
                .font(.largeTitle)
                .padding()
            Text(viewModel.weatherDescription ?? "")
        }.onAppear(perform: {
            viewModel.refreshWeatherData()
        })
        .padding()
    }
}

#Preview {
    WeatherView()
}
