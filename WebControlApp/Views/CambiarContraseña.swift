//
//  CambiarContraseña.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI

struct CambiarContrasen_a: View {
    
    @State private var id: String = ""
    @State private var contraseña: String = ""
    @State private var codigo: String = ""
    @State private var iniciar: Bool = false
    
    var body: some View {
        ZStack{
            Group{
                NavigationLink(destination: ValidarCodigo(),isActive: $iniciar, label: {EmptyView()})
            }
            Color.ui.colorWebControl
                .ignoresSafeArea()
            
            VStack{
                WCLogo(name: "logoWebControl",width: 230,height: 90)
                WCText(titleType: .title("Cambiar contraseña"))
                WCText(titleType: .subtitle("Hemos enviado un código de verificación a su numero celular y correo registrado, ingrese a continuación su nueva contraseña y su código de verificación"))
                WCTextField(text: "ID")
                WCTextField(text: "Nueva Contraseña")
                WCTextField(text: "Codigo de Verificación")
                HStack{
                    WCButton(name: "REENVIAR CODIGO",backgroundColor: .black, textColor: .white, width: 190)
                    WCButton(name: "ACEPTAR",backgroundColor: .black, textColor: .white, width: 150)
                }
                
            }
        }
    }
}

struct CambiarContrasen_a_Previews: PreviewProvider {
    static var previews: some View {
        CambiarContrasen_a()
    }
}
