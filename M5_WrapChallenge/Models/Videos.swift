//
//  Videos.swift
//  M5_WrapChallenge
//
//  Created by tom montgomery on 2/2/23.
//

import Foundation

// Decodable so we can use the JSON decoder
// Identifiable so we can loop through it and show it in a list
struct Video: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var url: String
}
