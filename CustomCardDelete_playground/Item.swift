//
//  Item.swift
//  CustomCardDelete_playground
//
//  Created by 양시관 on 3/26/24.
//

import SwiftUI

import Foundation

struct Item: Identifiable {
    let id = UUID().uuidString
    let name: String
    let details: String
    let image: String
    let price: Float
    var quantity: Int
    var offset: CGFloat = 0
    var isSwiped: Bool = false
}
