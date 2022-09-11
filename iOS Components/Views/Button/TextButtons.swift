//
//  TextButtons.swift
//  iOS Components
//
//  Created by Wind Versi on 10/9/22.
//

import SwiftUI

struct TextButtons: View {
    // MARK: - Props
    
    // MARK: - UI
    var body: some View {
        VStack(spacing: 14) {
            
            // Destructive Role
            Button(
                "Delete",
                role: .destructive,
                action: {}
            )
            
            // Cancel Role
            Button(
                "Cancel",
                role: .cancel,
                action: {}
            )
        }
    }
}

// MARK: - Preview
struct TextButtons_Previews: PreviewProvider {
    static var previews: some View {
        TextButtons()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
