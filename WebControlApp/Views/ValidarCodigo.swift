//
//  ValidarCodigo.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI
@available(iOS 16.0, *)
struct ValidarCodigo: View {
    
    @State private var codigo: String = ""
    @State private var codigoMensaje = ""
    @State private var codigoError: Bool = false
    @State private var iniciar: Bool = false
    
    var body: some View {
        ZStack{
            Group{
                NavigationLink(destination: ConfirmarNContrasen_a(),isActive: $iniciar, label: {EmptyView()})
            }
            Color.ui.colorWebControl
                .ignoresSafeArea()
            ZStack{
                WCLogo(name: "logoWebControl",width: 230,height: 90)
                    .padding(.top,-230)
                
            }
            VStack{
                WCText(titleType: .title("Cambio de contraseña"),color: .white).padding(.top,50)
                WCText(titleType: .subtitle("Hemos enviado un código de verificación al numero ingreselo en el siguiente recuadro"),color: .white)
                TextFieldImageNot(TxtFieldType: .named("Ingrese el codigo de verificación"), bindingVar: $codigo)
                    .keyboardType(.numberPad)
                    .onChange(of: codigo) { newValue in
                        if !codigo.isEmpty {
                            codigoError = false
                            codigoMensaje = ""
                        }
                        if contieneCaracteresEspeciales(newValue) {
                            codigo = String(newValue.filter { $0.isLetter || $0.isNumber })
                        }
                    }
                if !codigoMensaje.isEmpty {
                     Text(codigoMensaje)
                         .foregroundColor(.red)
                         .padding(.top,-25)
                }
                HStack{ 
                    WCButton(action: {}, name: "REENVIAR",backgroundColor: .black,textColor: .white, width: 150)
                    WCButton(action: {
                        if codigo.isEmpty{
                            validate()
                        }else{
                            iniciar = true
                        }
                        
                    }, name: "VALIDAR",backgroundColor: .black,textColor: .white,width: 150)
                }
                
            }
        }
    }
    func validate(){
        if codigo.isEmpty{
            codigoError = true
            codigoMensaje = "Ingrese el codigo que fue enviado a su correo"
        }
    }
}

struct ValidarCodigo_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            ValidarCodigo()
        } else {
            // Fallback on earlier versions
        }
    }
}
