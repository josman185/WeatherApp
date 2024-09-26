//
//  Weather.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/25/24.
//

import Foundation

public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse) {
        self.city = response.name
        self.temperature = "\(Int(response.main.temp))"
        self.description = response.weather.first?.description.capitalized ?? ""
        self.iconName = response.weather.first?.icon ?? ""
    }
}

struct APIResponse: Decodable {
    let name: String
    let main: Main
    let weather: [APIWeather]
}

struct Main: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case icon = "main"
    }
}
