//
//  CambiarContraseña.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI
import Combine
@available(iOS 16.0, *)
struct CambiarContrasen_a: View {
    
    let limitId = 15
    @State private var passwordMensaje = ""
    @State private var passwordError: Bool = false
    @State private var codigoMensaje = ""
    @State private var codigoError: Bool = false
    @State private var id: String = ""
    @State private var contraseña: String = ""
    @State private var codigo: String = ""
    @State private var iniciar: Bool = false
    
    var body: some View {
            ZStack{
                Group{
                    NavigationLink(destination: Login(),isActive: $iniciar, label: {EmptyView()})
                }
                Color.ui.colorWebControl
                    .ignoresSafeArea()
                ZStack{
                    WCLogo(name: "logoWebControl",width: 230,height: 90)
                        .padding(.top,-300)
                    
                }
                VStack{
                    WCText(titleType: .title("Cambiar contraseña"),color: .white)
                        .padding(.top,50)
                    WCText(titleType: .subtitle("""
                                            Hemos enviado un código de verificación a su numero celular y correo registrado, ingrese a continuación su nueva contraseña y su código de verificación
                                            """),color: .white)
                    TextFieldImageNot(TxtFieldType: .named("ID"), bindingVar: $id)
                        .keyboardType(.alphabet)
                        .onReceive(Just(id)) { _ in limitText(limitId) }
                        .onChange(of: id) { newValue in
                            if contieneCaracteresEspeciales(newValue) {
                                id = String(newValue.filter { $0.isLetter || $0.isNumber })
                            }
                        }
                        .padding(.bottom,-20)
                    TextFieldImageNot(TxtFieldType: .password("Nueva Contraseña"), bindingVar: $contraseña)
                        .keyboardType(.alphabet)
                        .onChange(of: contraseña) { newValue in
                            if !contraseña.isEmpty {
                                passwordError = false
                                passwordMensaje = ""
                            }
                            if contieneCaracteresEspeciales(newValue) {
                                contraseña = String(newValue.filter { $0.isLetter || $0.isNumber })
                            }
                        }
                        .padding(.bottom,-20)
                    if !passwordMensaje.isEmpty {
                        Text(passwordMensaje)
                            .foregroundColor(.red)
                            .padding(.top,-5)
                    }
                    TextFieldImageNot(TxtFieldType: .named("Codigo de Verificación"), bindingVar: $codigo)
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
                        WCButton(action: {}, name: "REENVIAR CODIGO",backgroundColor: .black, textColor: .white, width: 190)
                        WCButton(action: {
                            if contraseña.isEmpty && codigo.isEmpty{
                                validate()
                            }else{
                                iniciar = true
                            }
                        }, name: "ACEPTAR",backgroundColor: .black, textColor: .white, width: 150)
                    }
                    
                }
            }
            .ignoresSafeArea(.keyboard)
    }
    private func camposEstanLlenos() -> Bool {
        return id.isEmpty || contraseña.isEmpty || codigo.isEmpty
    }
    func  limitText(_ upper: Int) {
        if id.count > upper {
            id = String(id.prefix(upper))
        }
    }
    
    func validate(){
        if contraseña.isEmpty && codigo.isEmpty{
            passwordError = true
            passwordMensaje = "Escriba su Nueva Contraseña"
            codigoError = true
            codigoMensaje = "Ingrese el codigo que fue enviado a su correo"
        }
    }
    
}

struct CambiarContrasen_a_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            CambiarContrasen_a()
        } else {
            // Fallback on earlier versions
        }
    }
}
