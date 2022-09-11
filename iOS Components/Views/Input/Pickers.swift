//
//  Pickers.swift
//  iOS Components
//
//  Created by Wind Versi on 11/9/22.
//

import SwiftUI

enum LabelStyles: String, Identifiable, CaseIterable {
    case title = "Title"
    case icon = "Icon"
    case titleAndIcon = "Title + Icon"
    var id: String {
        self.rawValue
    }
}

enum PickerStyles: String, Identifiable, CaseIterable {
    case automatic = "Automatic"
    case inline = "Inline"
    case segmented = "Segmented"
    case wheel = "Wheel"
    var id: String {
        self.rawValue
    }
}

struct Pickers: View {
    // MARK: - Props
    @State private var selectedOption = 1
    var labelStyle: LabelStyles = .title
    var pickerStyle: PickerStyles = .segmented
    var maxOptions = 4
    
    // MARK: - UI
    var body: some View {
        
        // MARK: - Picker
        // Modifier:
        
        // * .pickerStyle(PickerStyle)
        // .automatic
        // .inline (default) - tap to reveal list of options
        // .segmented - tab like options
        // .wheel - scroll to pick option
        
        VStack(spacing: 0) {
            
            Picker(
                "Options",
                selection: $selectedOption
            ) {
                
                ForEach(1...maxOptions, id: \.self) { i in
                    
                    Label("Title", systemImage: "paintbrush")
                        .if(labelStyle == .title) { view in
                            view.labelStyle(.titleOnly)
                        }
                        .if(labelStyle == .icon) { view in
                            view.labelStyle(.iconOnly)
                        }
                        .if(labelStyle == .titleAndIcon) { view in
                            view.labelStyle(.titleAndIcon)
                        }
                        .tag(i)
                    
                } //: ForEach
                
            } //: Picker
            .if(pickerStyle == .automatic) { view in
                view.pickerStyle(.automatic)
            }
            .if(pickerStyle == .inline) { view in
                view.pickerStyle(.inline)
            }
            .if(pickerStyle == .segmented) { view in
                view.pickerStyle(.segmented)
            }
            .if(pickerStyle == .wheel) { view in
                view.pickerStyle(.wheel)
            }
            
        } //: VStack
    }
    
}

// MARK: - Preview
// Display Name: color scheme / picker style / label style / max options
struct Pickers_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light
    static var maxOptions = 4
    
    static var previews: some View {
        
        ForEach(PickerStyles.allCases) { pickerStyle in
            
            ForEach(LabelStyles.allCases) { labelStyle in

                Pickers(
                    labelStyle: labelStyle,
                    pickerStyle: pickerStyle,
                    maxOptions: maxOptions
                )
                    .previewLayout(.sizeThatFits)
                    .padding()
                    .preferredColorScheme(scheme)
                    .previewDisplayName(
                        displayName(
                            "\(scheme)".firstCap(),
                            "\(pickerStyle.id)",
                            "\(labelStyle.id)",
                            "\(maxOptions)"
                        )
                    )
                
            } //: ForEach
            
        } //: ForEach
    }
}
