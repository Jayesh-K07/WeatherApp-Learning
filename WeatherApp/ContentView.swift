//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jayesh Kriplani on 06/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
//            Custom Colors
//            BackgroundView(topColor: isNight ? .black : .blue,
//                           bottomColor: isNight ? .gray : Color("lightblue"))
            BackgroundView(isNight: isNight)
            //InBuilt Colors Xcode
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: "66°")
             
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: "76°")
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: "88°")
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind",
                                   temperature: "55°")
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: "40°")
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snowflake",
                                   temperature: "25°")
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  BackgroundColor: .white, isNight: isNight)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    
    var body: some View {
       VStack {
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
//    var topColor: Color
//    var bottomColor: Color
    var isNight: Bool

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea(.all)
        
        ContainerRelativeShape()
                    .fill(isNight ? Color.black.gradient : Color.blue.gradient)
                    .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}

