//
//  Cargo.swift
//  CargoContainerSUI
//
//  Created by Никита Гуляев on 27.07.2024.
//

import Foundation

struct Cargo {
    let width: Double
    let height: Double
    let depth: Double
    
    var volume: Double {
        return width * height * depth
    }
}

// Custom operator for entering the volumes of two Cargo objects
infix operator +: AdditionPrecedence

func + (first: Cargo, second: Cargo) -> Cargo {
    return Cargo(width: first.width + second.width,
                 height: first.height + second.height,
                 depth: first.depth + second.depth)
}
