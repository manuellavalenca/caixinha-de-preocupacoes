//
//  ChooseIntentBilheteView.swift
//  caixinha
//
//  Created by Manuella Valença on 26/07/20.
//  Copyright © 2020 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

struct PickerIntentBilheteView: View {
    @Binding var currentIndex: Int
    @Environment(\.managedObjectContext) var managedObjectContext
    let intentList = ["Algo bom", "Algo que te preocupa"]
    
    init(index: Binding<Int>) {
        self._currentIndex = index
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: colors.darkGray, .font: fonts.smallerTitleCustom!], for: .normal)
    }
    
    var body: some View {
        VStack{
            //Form {
            Section {
                Picker(selection: $currentIndex, label:
                    Text("Categoria"), content: {
                        ForEach(0..<self.intentList.count){ index in
                            Text(self.intentList[index]).tag(index)
                        }
                    }
                ).font(fonts.captionCustom)
                    .pickerStyle(SegmentedPickerStyle())
                    .foregroundColor(Color(colors.darkGray))
            }
        }
    }
}
