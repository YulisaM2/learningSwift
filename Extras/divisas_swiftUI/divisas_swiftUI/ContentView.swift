//
//  ContentView.swift
//  divisas_swiftUI
//
//  Created by Trinity on 07/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var tipoCambioStr : String = ""
    @State var pesosStr : String = ""
    @State var dolaresStr : String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Text("Divisas!")
                .bold()
                .padding()
                .font(.largeTitle)
            Spacer()
            HStack{
                Text("Tipo de cambio")
                TextField("",text: $tipoCambioStr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.leading, 20.0)
            .padding(.trailing, 20)
            HStack{
                Text("Pesos")
                TextField("",text: $pesosStr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.leading, 20.0)
            .padding(.trailing, 20)
            HStack{
                Text("Dolares")
                TextField("",text: $dolaresStr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(true)
            }.padding(.leading, 20.0)
            .padding(.trailing, 20)
            Spacer()
            Button(action: {
                if let tipoCambio = Double(tipoCambioStr),
                   let pesos = Double(pesosStr){
                    self.dolaresStr = String(pesos/tipoCambio)
                }
                
            }, label: {
                Image("boton-calcular")
            })
            .padding(20)
            
            Image("dollarSign")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
