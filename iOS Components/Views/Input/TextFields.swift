//
//  TextFields.swift
//  iOS Components
//
//  Created by Wind Versi on 10/9/22.
//

import SwiftUI

enum TextFieldStyles: String, Identifiable, CaseIterable {
    case automatic = "Automatic"
    case plain = "Plain"
    case roundedBorder = "Rounded Border"
    var id: String {
        self.rawValue
    }
}

struct TextFields: View {
    // MARK: - Props
    var textFieldStyle: TextFieldStyles = .automatic
    @State private var text: String = ""
    @FocusState private var focusedField: Bool

    // MARK: - UI
    var body: some View {
        
        // MARK: - Text Field
        // Modifiers:
        
        // * textFieldStyle(TextFieldStyle)
        // .automatic
        // .plain (default) - no borders or colors
        // .roundedBorder - rounded gray rectangle border
        
        // * focused()
        // track focus state
        
        // * textInputAutocapitalization(TextInputAutocapitalization)
        // .never
        // .words
        // .sentences
        // .characters
        // toggles auto-capitalization
        
        // * disableAutocorrection(Bool)
        // toggles auto-correction
        
        VStack {
            
            TextField(
                   "Placeholder",
                   text: $text
               )
               .focused($focusedField)
               .textInputAutocapitalization(.never)
               .disableAutocorrection(true)
               .if(textFieldStyle == .plain) { view in
                   view.textFieldStyle(.plain)
               }
               .if(textFieldStyle == .roundedBorder) { view in
                   view.textFieldStyle(.roundedBorder)
               }
               .onSubmit {
                  validateText(text)
               }
            
        } //: VStack
    }
    
    // MARK: Actions
    func validateText(_ text: String) {
        
    }
    
}

// MARK: - Preview
// Display Name: color scheme / field style
struct TextFields_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light

    static var previews: some View {
        
        ForEach(TextFieldStyles.allCases) { style in
            TextFields(textFieldStyle: style)
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(scheme)
                .previewDisplayName(
                    displayName(
                        "\(scheme)".firstCap(),
                        "\(style.id)"
                    )
                )
        } //: ForEach
        
    }
}
