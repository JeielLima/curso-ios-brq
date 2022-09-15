//
//  BlueCircleView.swift
//  Navigation
//
//  Created by Jeiel Lima on 13/09/22.
//

import SwiftUI

struct BlueCircleView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                ZStack{
                    
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.blue)
                    
                    Text("2")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .bold))
                }
                
                NavigationLink(destination: GreenCircleView(), label: {
                    Text("Próxima Página")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                })
            }
        }
    }
}

struct BlueCircleView_Previews: PreviewProvider {
    static var previews: some View {
        BlueCircleView()
    }
}
