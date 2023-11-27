//
//  WCAlert.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 27/11/23.
//

import SwiftUI

struct WCAlert: View {
    
    @State var isPresent: Bool = true
    var title:String
    var message:String
    var pButton:String
    var sbutton:String
    
    var body: some View {
        VStack{
            
        }.alert(isPresented: $isPresent, content: {
            Alert(title: Text(title),
                  message: Text(message),
                  primaryButton: .default(Text(pButton)), secondaryButton: .destructive(Text(sbutton)))
            
        })
    }
}

struct WCAlert_Previews: PreviewProvider {
    static var previews: some View {
        WCAlert(title: "Hola", message: "Bienvenido", pButton: "Aceptar", sbutton: "Cancelar")
    }
}
