// ProfileView.swift
// Panic
//
// Created by Дмитрий Яновский on 18.06.24.

import SwiftUI

struct ProfileView: View {
    
    @State var fullname = "Dzmirty Yanouski"
    @State var email = "yanik-1993@rambler.ru"
    @State var height = "176.5"
    @State var weight = "69.2"
    @State var dateOfBirdday = "29.11.1993"
    @State var bikeName = "Specialized S-Works Venge"
    @State var bikeImage = "sworks" // Add your bike image name here
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Add logout action here
                }) {
                    Image(systemName: "text.chevron.left")
                        .foregroundColor(.black)
                        .font(.headline)
                }

                Spacer()
                
                Text("PROFILE")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    // Add edit action here
                }) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                        .font(.headline)
                }
            }
           
            
            ScrollView {
                VStack(spacing: 20) {
                    // Profile Image and Name
                    HStack {
                        Image("PhotoProfile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        
                        VStack(alignment: .leading) {
                            Text(fullname)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text(email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                  
                    // Bike Image and Name
                   
                    Divider()
                    
                    // Statistics
                    VStack {
                        Text("Statistics")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        
                        HStack(spacing: 20) {
                            StatisticCard(title: height, subtitle: "Height (cm)", color: .black)
                            StatisticCard(title: weight, subtitle: "Weight (kg)", color: .black)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // Personal Information
                    VStack {
                        Text("Personal Information")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        
                        HStack {
                            VStack(alignment: .leading){
                                Text("Height")
                                    .font(.headline)
                                CustomTextFields(text: $height, placeholder: "Your height")
                            }
                            VStack(alignment: .leading) {
                                Text("Weight")
                                    .font(.headline)
                                CustomTextFields(text: $weight, placeholder: "Your weight")
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Date of Birth")
                                    .font(.headline)
                                CustomTextFields(text: $dateOfBirdday, placeholder: "Your birthday")
                                    .frame(width: 200)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    
                    Divider()
                }
                .padding(.vertical)
            }
        }
        .background(Color(.systemBackground))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct StatisticCard: View {
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(width: 150, height: 100)
        .background(color.opacity(0.1))
        .cornerRadius(10)
    }
}

struct CustomTextFields: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .disabled(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
