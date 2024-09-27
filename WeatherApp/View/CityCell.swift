//
//  CityCell.swift
//  WeatherApp
//
//  Created by Jose Vargas on 9/26/24.
//

import SwiftUI

struct CityCell: View {
    let city: APICity
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(city.name.capitalized)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("\(city.country), \(city.state)".capitalized)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

//#Preview {
//    CityCell()
//}
