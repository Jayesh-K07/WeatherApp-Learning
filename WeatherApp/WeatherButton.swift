//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Jayesh Kriplani on 06/08/24.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var BackgroundColor: Color
    var isNight: Bool
    
    var body: some View {
        Text(title)
            .frame(width: 280,height: 50)
            .background(BackgroundColor)
            .foregroundColor(isNight ? .black : textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

