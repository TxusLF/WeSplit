//
//  ContentView.swift
//  WeSplit
//
//  Created by Mati on 30/10/2019.
//  Copyright © 2019 CIFO VIOLETA. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var amountPerPerson = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
        
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = self.tipPercentages[tipPercentage]
        let orderAmount  = Double(checkAmount) ?? 0.0 //chekAmount o 0.0 en caso que lo que nos pasen no sea valido o nulo
        let tipValue = (orderAmount / 100) * Double(tipSelection)
        let grandTotal = orderAmount + tipValue
        
        let amountPerPerson = (grandTotal / peopleCount)
        

        return amountPerPerson
        
    }
    
    
    var body: some View {
         NavigationView {
        Form {
            Section {
               TextField("Amount", text: $checkAmount)
                .keyboardType(.decimalPad)
            }
            
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            
            Section {
               
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
                }
            }
            
            }
         .navigationBarTitle("We SPLIT") //el titulo se lo ponemos al formulario no al navigation view sino, seria fijo
        
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
