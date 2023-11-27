//
//  ConfirmarNContraseña.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI

struct ConfirmarNContrasen_a: View {

    @State private var contraseña: String = ""
    @State private var confirmar: String = ""
    @State private var iniciar: Bool = false
    
    var body: some View {
        ZStack{
            Color.ui.colorWebControl
                .ignoresSafeArea()
            VStack{
                WCLogo(name: "logoWebControl",width: 230,height: 90)
                WCText(titleType: .title("Cambio de contraseña"))
                WCText(titleType: .subtitle("Establesca una nueva contraseña para su cuenta"))
                TextFieldImageNot(text: "Contraseña Nueva").padding(.bottom,-20)
                TextFieldImageNot(text: "Confirmar Contraseña")
                WCButton(name: "GUARDAR",backgroundColor: .black, textColor: .white)
            }
        }
        
    }
}

struct ConfirmarNContrasen_a_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmarNContrasen_a()
    }
}
