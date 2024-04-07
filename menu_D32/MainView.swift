//
//  ContentView.swift
//  menu_D32
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/30.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack{
            NavigationLink {
                SushiView()
                    .navigationBarBackButtonHidden()
            } label: {
                ZStack{
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color.red, Color.green], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 200, height: 200)
                    Image("LOGO")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190, height: 190)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
