//
//  TipView.swift
//  NavigationSwiftUI
//
//  Created by Neosoft on 07/12/25.
//

import SwiftUI
import TipKit

struct TipView: Tip {
    var title: Text {
        Text("Title")
    }
    
    var message: Text? {
        Text("Hello, World!")
    }
}

