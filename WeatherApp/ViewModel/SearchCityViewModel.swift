//
//  SearchCityViewModel.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/26/24.
//

import Foundation

final class SearchCityViewModel: ObservableObject {
    
    @Published var cities: [APICity] = []
    
    private let networkManager: NetworkManager!
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    public func getWeatherDatabyCity(name: String) {
        networkManager.loadWeatherDataBy(city: name) { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cities):
                        self.cities = cities
                    print(self.cities)
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        //alertItem = AlertContext.invalidResponse
                        print("invalidResponse Error: \(error.localizedDescription)")
                    case .invalidURL:
                        print("invalidURL Error: \(error.localizedDescription)")
                        //alertItem = AlertContext.invalidURL
                    case .invalidData:
                        print("invalidData Error: \(error.localizedDescription)")
                        //alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        print("unableToComplete Error: \(error.localizedDescription)")
                        //alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
