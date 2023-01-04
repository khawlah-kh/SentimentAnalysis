//
//  ViewModel.swift
//  SentimentAnalysis
//
//  Created by Khawlah Khalid on 04/01/2023.
//

import SwiftUI
import NaturalLanguage

final class ViewModel: ObservableObject{
    @Published var inputText : String = ""
    @Published var result: String = ""
    @Published var resultColor: Color = .blue

    var tagger = NLTagger(tagSchemes: [.sentimentScore])
    func analyzeSentiment(){
        tagger.string = inputText
        let (sentimentScore, _) = tagger.tag(at: inputText.startIndex, unit: .paragraph, scheme: .sentimentScore)
        let scoreString = sentimentScore?.rawValue ?? ""
        let score = Double(scoreString) ?? 0.0
        switch score{
        case 0.1...:
            result = "Positive ☺️"
            resultColor = .green
        case ..<0:
            result = "Negative ☹️"
            resultColor = .red
        default :
            result = "Neutral 🤗"
            resultColor = .blue
        }
    }

}
