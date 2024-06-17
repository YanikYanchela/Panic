//
//  MainView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 18.06.24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab = "EVENTS"
    private let tabs = ["EVENTS", "RATING", "PROFILE", "SETTINGS"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Text("EVENTS")
                    .tag("EVENTS")
                
                Text("RATING")
                    .tag("RATING")
                
                Text("PROFILE")
                    .tag("PROFILE")
                
                Text("SETTINGS")
                    .tag("SETTINGS")
            }
            
            HStack(alignment: .top) {
                Spacer()
                ForEach(tabs, id: \.self) { tab in
                    TabBarItem(tab: tab, selectedTab: $selectedTab)
                    Spacer()
                }
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .black.opacity(0.15), radius: 5, x: 3, y: 3)
        }
        .ignoresSafeArea()
    }
}

struct TabBarItem: View {
    let tab: String
    @Binding var selectedTab: String

    var body: some View {
        Button {
            withAnimation {
                selectedTab = tab
            }
        } label: {
            HStack {
                ZStack {
                    if tab == "PROFILE" {
                        Circle()
                            .frame(width: 40, height: 45)
                            .foregroundColor(selectedTab == tab ? .black : .white)
                        Image("PhotoProfile")
                            .resizable()
                            .frame(width: 37, height: 37)
                            .background(.white)
                            .clipShape(Circle())
                    } else {
                        Image(tab)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(selectedTab == tab ? .black : .gray)
                    }
                }
                
                if selectedTab == tab {
                    Text(tab)
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                }
            }
            .opacity(selectedTab == tab ? 1 : 0.7)
            .padding(.vertical, tab == "PROFILE" ? 0 : 10)
            .padding(.horizontal, tab == "PROFILE" ? 10 : 10)
            .background(selectedTab == tab ? Color.white : Color.clear)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedTab == tab ? Color.black.opacity(0.2) : Color.clear, lineWidth: 1)
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
