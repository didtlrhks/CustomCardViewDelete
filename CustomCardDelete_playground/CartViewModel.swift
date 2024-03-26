//
//  CartViewModel.swift
//  CustomCardDelete_playground
//
//  Created by 양시관 on 3/26/24.
//

import SwiftUI


import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published var items = [
        Item(name: "Рубашка", details: "Size XL", image: "p1", price: 20.99, quantity: 1),
        Item(name: "Майка", details: "Size XL", image: "p2", price: 10.30, quantity: 1),
        Item(name: "Свитер", details: "Size XXL", image: "p3", price: 24.99, quantity: 2),
        Item(name: "Джинсы", details: "Color blue", image: "p4", price: 15.0, quantity: 1),
    ]
    
    func getIndex(item: Item) -> Int {
        return items.firstIndex { item1 -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    
   
    
    func deleteItem(myItem: Item) {
        items.removeAll { item in
            return item.id == myItem.id
        }
    }
}
