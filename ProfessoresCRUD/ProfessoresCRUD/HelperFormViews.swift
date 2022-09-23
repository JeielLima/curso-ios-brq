//
//  HelperFormViews.swift
//  ProfessoresCRUD
//
//  Created by Jeiel Lima on 23/09/22.
//

import Foundation
import SwiftUI

struct TextFormView: View {
    
    var text : String = ""
    
    var body: some View {
        Text(text)
            .font(.system(size: 20))
            .fontWeight(.bold)
    }
}

struct ButtonFormView : View {
    
    var text : String = ""
    
    var body: some View{
        Text(text)
            .frame(width: 280, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(20)
    }
}
