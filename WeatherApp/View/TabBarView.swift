//
//  TabBarView.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/26/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {
            WeatherView()
                .tabItem {
                    Image(systemName: "building.2.crop.circle")
                    Text("Local")
                }
            SearchCityView()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search")
                }
        }
    }
}
