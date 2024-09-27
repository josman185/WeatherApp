//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/25/24.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView() //WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
