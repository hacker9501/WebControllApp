//
//  CustonButton.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 24/11/23.
//

import SwiftUI

struct WCButton: View {
    
    @State private var iniciar: Bool = false
    var name: String?
    var backgroundColor: Color?
    var cornerRadius: CGFloat?
    var textColor: Color?
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        VStack{
            Button(action: {
                iniciar = true
            }, label: {
                Text(name ?? "")
                    .frame(width: width ?? 320,height: height ?? 50)
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius ?? 50)
                    .foregroundColor(textColor)
                    //.padding(.top,10)
                
            })
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        WCButton(name: "INGRESAR", backgroundColor: Color.ui.colorWebControl, cornerRadius: 50, textColor: .white,width: 320,height: 55)
        
    }
}
