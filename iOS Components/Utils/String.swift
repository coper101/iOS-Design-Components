//
//  String.swift
//  iOS Components
//
//  Created by Wind Versi on 11/9/22.
//

import Foundation

extension String {
    
    func firstCap() -> String {
        self.prefix(1).capitalized + dropFirst()
    }
    
}

func displayName(_ components: String...) -> String {
    components.reduce("") { acc, component in
        acc + ((acc.isEmpty) ? "" : " / ") + component
    }
}

