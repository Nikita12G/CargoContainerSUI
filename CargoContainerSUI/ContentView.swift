//
//  ContentView.swift
//  CargoContainerSUI
//
//  Created by Никита Гуляев on 27.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var cargo1Height: String
    @State private var cargo1Width: String
    @State private var cargo1Depth: String
    
    @State private var cargo2Height: String
    @State private var cargo2Width: String
    @State private var cargo2Depth: String
    
    @State private var combinedCargo: Cargo
    
    init(cargo1Height: String, cargo1Width: String, cargo1Depth: String, cargo2Height: String, cargo2Width: String, cargo2Depth: String, combinedCargo: Cargo) {
        self.cargo1Height = cargo1Height
        self.cargo1Width = cargo1Width
        self.cargo1Depth = cargo1Depth
        self.cargo2Height = cargo2Height
        self.cargo2Width = cargo2Width
        self.cargo2Depth = cargo2Depth
        self.combinedCargo = combinedCargo
    }
    
    let container = Container(items: [1, 2, 3, 4, 5])
    let containerIndex = 2
    
    var body: some View {
        VStack {
            Spacer()
            Text("Пример использования Container")
            if let element = container[containerIndex] {
                Text("Элемент по индексу \(containerIndex) в Container: \(element)")
            }
                Spacer()
            Text("Карго калькулятор")
                .bold()
                .font(.title)
            Text("Все размеры указывать в метрах")
                .padding(.bottom)
                .font(.title2)
            Text("Карго 1")
                .font(.title3)
            HStack {
                TextField("Высота", text: $cargo1Height)
                    .modifier(CustomTextFieldStyle())
                TextField("Ширина", text: $cargo1Width)
                    .modifier(CustomTextFieldStyle())
                TextField("Глубина", text: $cargo1Depth)
                    .modifier(CustomTextFieldStyle())
            }.padding()
            Text("Карго 2")
                .font(.title3)
            HStack {
                TextField("Высота", text: $cargo2Height)
                    .modifier(CustomTextFieldStyle())
                TextField("Ширина", text: $cargo2Width)
                    .modifier(CustomTextFieldStyle())
                TextField("Глубина", text: $cargo2Depth)
                    .modifier(CustomTextFieldStyle())
            }.padding()
            .padding(.bottom, 100)
            Button {
                let cargo1 = Cargo(width: Double(cargo1Height) ?? 0, height: Double(cargo1Height) ?? 0, depth: Double(cargo1Depth) ?? 0)
                let cargo2 = Cargo(width: Double(cargo2Height) ?? 0, height: Double(cargo2Height) ?? 0, depth: Double(cargo2Depth) ?? 0)
                combinedCargo = cargo1 + cargo2
            } label: {
                Text("Рассчитать объем")
            }.padding(.bottom, 50)
                .buttonStyle(.borderedProminent)
            Text("Общий объем составит \(combinedCargo.volume) m^3")
            Spacer()
        }
    }
}

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .keyboardType(.numberPad)
            .background(.blue.opacity(0.5), in: .buttonBorder)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .font(.title3)
    }
}

#Preview {
    ContentView(cargo1Height: "", cargo1Width: "", cargo1Depth: "", cargo2Height: "", cargo2Width: "", cargo2Depth: "", combinedCargo: Cargo(width: 0, height: 0, depth: 0))
}
