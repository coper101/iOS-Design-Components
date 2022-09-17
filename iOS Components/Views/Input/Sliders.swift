//
//  Sliders.swift
//  iOS Components
//
//  Created by Wind Versi on 10/9/22.
//

import SwiftUI

struct Sliders: View {
    // MARK: - Props
    @State var value = 50.0
    @State var isEditing = false
    
    // MARK: - UI
    var body: some View {
        
        // MARK: - Slider
        
        VStack(spacing: 0) {
            
            Slider(
                value: $value,
                in: 0...100,
                step: 0.5,
                onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                }
            )
            
        }
    }
    
}

// MARK: - Preview
// Display Name: color scheme
struct Sliders_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light
    
    static var previews: some View {
        Sliders()
            .previewLayout(.sizeThatFits)
//            .padding()
            .preferredColorScheme(scheme)
            .previewDisplayName(
                displayName(
                    "\(scheme)".firstCap()
                )
            )
    }
}
