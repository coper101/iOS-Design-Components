//
//  Designs.swift
//  iOS Components
//
//  Created by Wind Versi on 3/7/22.
//

import SwiftUI

enum FontDesigns: String, Identifiable, CaseIterable {
    case `default`
    case rounded
    case monospaced
    case serif
    var id: String {
        self.rawValue
    }
}

struct Designs: View {
    // MARK: - Properties
    var design: FontDesigns = .default
    var size: CGFloat = 12
    var weight: Font.Weight = .regular
    
    // MARK: - UI
    var body: some View {
        
        // MARK: Text
        // Modifier:
        // * .font(
        //     .system(
        //        CGFloat,
        //        Font.TextStyle,
        //        Font.Design
        //     )
        //   )
        
        // Font.TextStyle
        // refer to TextStyles.swift
        
        // Font.Weight
        // refer to Weights.swift
        
        // Font.Design (4)
        // .default - SF PRO (San Serif)
        // .rounded - SF PRO ROUNDED
        // .monospaced - SF MONO
        // .serif -
                    
        Text("Title")
            .if(design == .default) { view in
                view.font(
                    .system(
                        size: size,
                        weight: weight,
                        design: .default
                    )
                )
            }
            .if(design == .rounded) { view in
                view.font(
                    .system(
                        size: size,
                        weight: weight,
                        design: .rounded
                    )
                )
            }
            .if(design == .monospaced) { view in
                view.font(
                    .system(
                        size: size,
                        weight: weight,
                        design: .monospaced
                    )
                )
            }
            .if(design == .serif) { view in
                view.font(
                    .system(
                        size: size,
                        weight: weight,
                        design: .serif
                    )
                )
            }
    }
}

// MARK: - Preview
// Display Name: color scheme / font design / font size / font weight
struct Designs_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light
    static var size: CGFloat = 12
    static var weight: Font.Weight = .regular

    static var previews: some View {
        ForEach(FontDesigns.allCases) { design in
            
            Designs(
                design: design,
                size: size,
                weight: weight
            )
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(scheme)
                .previewDisplayName(
                    displayName(
                        "\(scheme)".firstCap(),
                        "\(size)",
                        "\(design)".firstCap(),
                        "\(weight)".firstCap()
                    )
                )
            
        } //: ForEach
    }
}
