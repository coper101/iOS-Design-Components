//
//  Weights.swift
//  iOS Components
//
//  Created by Wind Versi on 11/9/22.
//

import SwiftUI

enum FontWeight: String, Identifiable, CaseIterable {
    case ultraLight
    case thin
    case light
    case regular
    case medium
    case semibold
    case bold
    case heavy
    case black
    var id: String {
        self.rawValue
    }
}

struct Weights: View {
    // MARK: - Properties
    var weight: FontWeight = .regular

    // MARK: - UI
    var body: some View {
            
        // MARK: Text
        // Modifier:
        // * .fontWeight(Font.Weight)
        
        // Font.Weight (9)
        // .ultrathin
        // .thin
        // .light
        // .regular (default)
        // .medium
        // .semibold
        // .bold
        // .heavy
        // .black
                    
        switch weight {
        case .ultraLight:
            Text("Title")
                .fontWeight(.ultraLight)
        case .thin:
            Text("Title")
                .fontWeight(.thin)
        case .light:
            Text("Title")
                .fontWeight(.light)
        case .regular:
            Text("Title")
                .fontWeight(.regular)
        case .medium:
            Text("Title")
                .fontWeight(.medium)
        case .semibold:
            Text("Title")
                .fontWeight(.semibold)
        case .bold:
            Text("Title")
                .fontWeight(.bold)
        case .heavy:
            Text("Title")
                .fontWeight(.heavy)
        case .black:
            Text("Title")
                .fontWeight(.black)
        }
            
    }
    
}

// MARK: - Preview
// Display Name: color scheme / font weight
struct Weights_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light

    static var previews: some View {
        ForEach(FontWeight.allCases) { weight in
            
            Weights(weight: weight)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(scheme)
                .previewDisplayName(
                    displayName(
                        "\(scheme)".firstCap(),
                        "\(weight)".firstCap()
                    )
                )
            
        } //: ForEach
    }
}
