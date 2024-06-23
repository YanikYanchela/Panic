//
//  ProfileMainView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 19.06.24.
//

import SwiftUI

struct ProfileMainView: View {
    @State private var selection = 0
    
    var body: some View {
        VStack {
           
            TabView(selection: $selection) {
                Text("Профиль")
                    .font(.title)
                    .tag(0)
                
                Text("Тренировки")
                    .font(.title)
                    .tag(1)
                
                Text("Прогресс")
                    .font(.title)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always ))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Spacer()
        }
        .padding(.horizontal)
    }
}
struct ProfileMainView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMainView()
    }
}



