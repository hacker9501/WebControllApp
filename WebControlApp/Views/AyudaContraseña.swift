//
//  AyudaContraseña.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI

struct AyudaContrasen_a: View {
    
    @State private var email: String = ""
    @State private var iniciar: Bool = false
    @State private var atras: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            Group{
                NavigationLink(destination: CambiarContrasen_a(),isActive: $iniciar, label: {EmptyView()})
            }
            Color.ui.colorWebControl
                .ignoresSafeArea()
            
            VStack{
                WCLogo(name: "logoWebControl",width: 230,height: 90)
                WCText(titleType: .title("Nesecita ayuda con su contraseña?"))
                WCText(titleType: .subtitle("Ingrese el Id que utiliza WebControl App y le ayudaremos a crear una nueva contraseña"))
                TextFieldImageNot(text: "Id")
                WCButton(name: "INGRESAR",backgroundColor: .black,textColor: .white)
                WCButton(name: "VOLVER",textColor: .white)
            }
        }
    }
}

struct AyudaContrasen_a_Previews: PreviewProvider {
    static var previews: some View {
        AyudaContrasen_a()
    }
}
