//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/25/24.
//

import SwiftUI

final class WeatherViewModel: ObservableObject {
    
    @Published var cityName: String?
    @Published var temperature: String?
    @Published var weatherDescription: String?
    @Published var weatherIcon: String = AppConstants.defaultIcon
    
    private let weatherService: WeatherService!
    
    init(weatherService: WeatherService = WeatherService()) {
        self.weatherService = weatherService
    }
    
    public func refreshWeatherData() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature) °C"
                self.weatherDescription = weather.description
                self.weatherIcon = AppConstants.iconMap[weather.iconName] ?? AppConstants.defaultIcon
            }
        }
    }
}
