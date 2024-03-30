//
//  SushiSheet.swift
//  menu_D32
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/30.
//

import SwiftUI

struct SushiSheet: View {
    
    @Binding var selectedSushiImage:String
    @Binding var selectedSushi:String
    @Binding var selectedSushiPrice:String
    @Binding var sushiSheet:Bool
    
    var body: some View {
        VStack{
            Image(selectedSushiImage)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            Spacer()
            Text(selectedSushi)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .scaleEffect(1.3)
                .foregroundColor(.brown)
            HStack{
                Image(systemName: "frying.pan.fill")
                    .foregroundColor(.gray)
                    .scaleEffect(1.5)
                VStack {
                    Text("Hungry Already?")
                        .fontWeight(.heavy)
                    Text("Sushi is Ready!")
                        .font(.footnote)
                }.foregroundColor(.gray)
            }
            .padding()
            .padding(.bottom)

            Text("$\(selectedSushiPrice)")
                .font(.title)
                .bold()
                .foregroundColor(.gray)
            Spacer()
            
            
        }
    }
}

#Preview {
    SushiSheet(selectedSushiImage: Binding.constant("avocado-maki"), selectedSushi: Binding.constant("Avocado Maki"), selectedSushiPrice: Binding.constant("1.99"), sushiSheet: Binding.constant(true))
}
