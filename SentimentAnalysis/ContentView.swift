//
//  ContentView.swift
//  SentimentAnalysis
//
//  Created by Khawlah Khalid on 04/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack {
            Text("🤔")
            Text("Sentiment Analyzer")
            TextField("", text: $vm.inputText)
                .textFieldStyle(.roundedBorder)
                .font(.title3)
                .onChange(of: vm.inputText) { _ in
                    vm.analyzeSentiment()
                }
                Text("\(vm.result)")
                .foregroundColor(vm.resultColor)  
        }
        .font(.title)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
