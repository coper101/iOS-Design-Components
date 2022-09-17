//
//  Colors.swift
//  iOS Components
//
//  Created by Wind Versi on 3/7/22.
//

import SwiftUI

struct Colors: View {
    
    // MARK: - UI
    var body: some View {
        VStack(spacing: 70) {
            
            // MARK: Colors
            // iOS 13:
            // .red
            // .orange
            // .yellow
            // .green
            // .blue
            // .purple
            // .pink
            // .white
            // .gray
            // .black
            
            // iOS 15:
            // .mint
            // .teal
            // .cyan
            // .indigo
            // .brown
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    Group {
                        Color.red
                        Color.orange
                        Color.yellow
                        Color.green
                        Color.blue
                        Color.purple
                        Color.pink
                        Color.white
                        Color.gray
                        Color.black
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle().strokeBorder(.gray, lineWidth: 0.5)
                    )
                    .padding(.leading, 40)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    Group {
                        Color.mint
                        Color.teal
                        Color.cyan
                        Color.indigo
                        Color.brown
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle().strokeBorder(.gray, lineWidth: 0.1)
                    )
                    .padding(.leading, 40)
                }
            }
            
            HStack(spacing: 0) {
                Group {
                    Color.primary
                    Color.secondary
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    Circle().strokeBorder(.gray, lineWidth: 0.1)
                )
                .padding(.leading, 40)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        } //: VStack
        .padding(.vertical, 50)
    }
}

// MARK: - Preview
struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Light")
        
        Colors()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark")
    }
}
