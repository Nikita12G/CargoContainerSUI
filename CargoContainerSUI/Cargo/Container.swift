//
//  Container.swift
//  CargoContainerSUI
//
//  Created by Никита Гуляев on 27.07.2024.
//

import Foundation

struct Container<T> {
    private var items: [T] = []
    
    init(items: [T]) {
        self.items = items
    }
    
    subscript(index: Int) -> T? {
        get {
            guard index >= 0 && index < items.count else {
                return nil
            }
            return items[index]
        }
        set {
            guard index >= 0 && index < items.count, let newValue = newValue else {
                return
            }
            items[index] = newValue
        }
    }
    
}
