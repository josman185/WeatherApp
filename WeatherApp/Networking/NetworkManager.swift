//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/26/24.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    public init() {}
    
    func loadWeatherDataBy(city: String, _ completed: @escaping (Result<[APICity], APIError>) -> Void) {
        guard let url = URL(string: "http://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=5&appid=\(AppConstants.API_KEY)")
        else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([APICity].self, from: data)
                completed(.success(decodedResponse.self))
            } catch let error {
                debugPrint(error)
                print("Error: \(error.localizedDescription)")
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
