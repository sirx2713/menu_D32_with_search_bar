//
//  SushiLogic.swift
//  menu_D32
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/30.
//

import Foundation

struct SushiLogic: Identifiable, Decodable{
    
    let id: UUID =  UUID()
    var name:String
    var price:String
    var imageName:String
    
}
