//
//  SushiView.swift
//  menu_D32
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/30.
//

import SwiftUI

struct SushiView: View {
    
    @State var sushiList = [SushiLogic]()
    @State var selectedSushiImage = ""
    @State var selectedSushi = ""
    @State var selectedSushiPrice = ""
    @State var searchSushi = ""
    @State var sushiSheet = false
    
    var filteredSushi: [SushiLogic] {
        guard !searchSushi.isEmpty else { return sushiList}
        return sushiList.filter { sushi in
            sushi.name.lowercased().contains(searchSushi.lowercased())
        }
    }
    var getData = DataServices()
    
    
    var body: some View {
        NavigationStack{
            List(filteredSushi){
                sushi in
                HStack{
                    Image(sushi.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(width: 58, height: 58)
                    Text(sushi.name)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("$\(sushi.price)")
                }
                .onTapGesture {
                    selectedSushiImage = sushi.imageName
                    selectedSushi = sushi.name
                    selectedSushiPrice = sushi.price
                    sushiSheet = true
                }
                .listRowBackground(
                    LinearGradient(colors: [Color("CreamLight"), Color("CreamDark")], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                
            }
            .listStyle(.plain)
            .navigationTitle(
                Text("Sushi Menu")
            )
            .searchable(text: $searchSushi, prompt: "Search Sushi")
            .sheet(isPresented: $sushiSheet, content: {
                SushiSheet(selectedSushiImage: $selectedSushiImage, selectedSushi: $selectedSushi, selectedSushiPrice: $selectedSushiPrice, sushiSheet: $sushiSheet)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.medium, .large])
            })
            .onAppear(perform: {
                sushiList = getData.sushiViewData()
            })
        }
    }
    
}
#Preview {
    SushiView()
}
