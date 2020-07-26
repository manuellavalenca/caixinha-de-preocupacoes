//
//  BigTextView.swift
//  caixinha
//
//  Created by Manuella Valença on 26/07/20.
//  Copyright © 2020 Manuella Valença. All rights reserved.
//

import SwiftUI

struct BigTextView: View {
    @State var text: String
    
    var body: some View {
        Text(self.text)
        .font(fonts.largeFont)
        .foregroundColor(Color(colors.darkGray))
        .padding()
        .accentColor(Color(colors.babyPink))
        .cornerRadius(20)
    }
}

