//
//  ViewControllerJson2.swift
//  ProyectoAvance
//
//  Created by Daniel Belmont on 05/06/22.
//
import SwiftUI

struct ContentView: View{
    
    @State private var quoteData: QuoteData?
    
    var body: some View{
        HStack {
            Spacer()
        }
    }
    


private func loadData() {
    
    guard let url = URL(string: "https://programming-quotes-api.herokuapp.com/quotes/random")else {
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            return
        }
        
        if let decodedData = try? JSONDecoder().decode(QuoteData.self, from: data){
            DispatchQueue.main.async {
                self.quoteData = decodedData
            }
        }
    }.resume()
}
    
}
struct QuoteData: Decodable {
    var _id: String
    var en: String
    var author: String
    var id: String
}
 
