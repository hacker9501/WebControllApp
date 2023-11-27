//
//  ValidarCodigo.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI

struct ValidarCodigo: View {
    
    @State private var id: String = ""
    @State private var contraseña: String = ""
    @State private var codigo: String = ""
    @State private var iniciar: Bool = false
    
    var body: some View {
        ZStack{
            Group{
                NavigationLink(destination: ConfirmarNContrasen_a(),isActive: $iniciar, label: {EmptyView()})
            }
            Color.ui.colorWebControl
                .ignoresSafeArea()
            VStack{
                WCLogo(name: "logoWebControl",width: 230,height: 90).padding(.bottom,40)
                WCText(titleType: .title("Cambio de contraseña"))
                WCText(titleType: .subtitle("Hemos enviado un código de verificación al numero ingreselo en el siguiente recuadro"))
                TextFieldImageNot(text: "Ingrese el codigo de verificación")
                HStack{ 
                    WCButton(name: "REENVIAR",backgroundColor: .black,textColor: .white, width: 150)
                    WCButton(name: "VALIDAR",backgroundColor: .black,textColor: .white,width: 150)
                }
                
            }
        }
    }
}

struct ValidarCodigo_Previews: PreviewProvider {
    static var previews: some View {
        ValidarCodigo()
    }
}
