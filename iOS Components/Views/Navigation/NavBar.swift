//
//  NavBar.swift
//  iOS Components
//
//  Created by Wind Versi on 5/9/22.
//

import SwiftUI

struct NavBar: View {
    // MARK: - Props
    var titleDisplayMode: NavigationBarItem.TitleDisplayMode = .inline
    
    // MARK: - UI
    var body: some View {
        
        // MARK: Navigation
        // Modifier:
        
        // * .navigationViewStyle(NavigationViewStyle)
        // NavigationViewStyle
        // .stack - iphone style
        // .column - ipad style
        
        // * .toolbar()
        // - specifies the items in the toolbar
        
        // * .navigationTitle(String)
        // - top title of screen
        
        // * .navigationBarHidden(Bool)
        // - toggle visibility of navigation bar
        
        // * .navigationBarTitleDisplayMode(TitleDisplayMode)
        // TitleDisplayMode
        // .inline - centered title on top
        // .large - left aligned title extends beyond regular toolbar height
        
        // * .navigationBarBackButtonHidden(Bool)
        // - toggle back button when on child's screen
        
        // MARK: Navigation Link
        // pushes another screen on top when tapped
        
        
        NavigationView {
            
            NavigationLink(destination: {
                Text("Child")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(titleDisplayMode)
                    .navigationTitle("Title")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Right Title") {
                                // Action
                            }
                        }
                    }
            }) {
                Text("Push")
            } //: NavigationLink
            
        } //: Navigation View
        .navigationBarTitleDisplayMode(titleDisplayMode)
        .navigationTitle("Title")
        .navigationViewStyle(.columns)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Right Title") {
                    // Action
                }
            }
        }
    }
    
    // MARK: - Actions
}

// MARK: - Preview
// Display Name: color scheme / navigation title display mode
struct NavBar_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light

    static var previews: some View {

        // Add Navigation as it's not visible on Preview
        NavigationView {
            NavBar()
        }
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(scheme)
        .previewDisplayName(
            displayName(
                "\(scheme)".firstCap(),
                "Inline"
            )
        )
        
        NavigationView {
            NavBar(titleDisplayMode: .large)
        }
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(scheme)
        .previewDisplayName(
            displayName(
                "\(scheme)".firstCap(),
                "Large"
            )
        )
        
    }
}
