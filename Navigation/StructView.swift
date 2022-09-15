//
//  StructView.swift
//  Navigation
//
//  Created by Jeiel Lima on 14/09/22.
//

import SwiftUI

struct StructView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct CircleView: View {
    
    var color: Color
    var text: String
    
    var body: some View{
        Circle()
            .frame(width: 150, height: 150)
            .foregroundColor(color)
            
        
        Text(text)
            .foregroundColor(.white)
            .font(.system(size: 70, weight: .bold))
    }
}

struct NavigationText : View {
    
    var color: Color
    var text: String
    
    var body: some View{
        Text(text)
            .frame(width: 200, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(30)
    }
}

//struct StructView_Previews: PreviewProvider {
//    static var previews: some View {
//        StructView()
//    }
//}
