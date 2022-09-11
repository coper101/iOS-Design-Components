//
//  DefaultFonts.swift
//  iOS Components
//
//  Created by Wind Versi on 3/7/22.
//

import SwiftUI

struct TextStyles: View {
    var textStyle: Font.TextStyle = .body
    
    // MARK: - UI
    var body: some View {
            
        // MARK: Text
        // Modifier:
        // * .font(.system(TextStyle))
        
        // TextStyle (11)
        // .largeTitle
        // .title
        // .title2
        // .title3
        // .body
        // .headline
        // .subheadline
        // .caption
        // .caption2
        // .callout
        // .footnote
        
        // TITLES
        Text("Title")
            .font(.system(textStyle))

    }
}

// MARK: - Preview
// Display Name: color scheme / font text style
struct DefaultFonts_Preview: PreviewProvider {
    static var scheme: ColorScheme = .light
    
    static var previews: some View {
        ForEach(Font.TextStyle.allCases, id: \.self) { textStyle in
            
            TextStyles(textStyle: textStyle)
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName(
                    displayName(
                        "\(scheme)".firstCap(),
                        "\(textStyle)".firstCap()
                    )
                )
            
        } //: ForEach
    }
}
