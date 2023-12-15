//
//  ConfirmarNContraseña.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI
@available(iOS 16.0, *)
struct ConfirmarNContrasen_a: View {
    
    @State private var contraseña: String = ""
    @State private var confirmar: String = ""
    @State private var guardar: Bool = false
    @State private var passwordError: Bool = false
    @State private var mensajeError = ""
    @State private var confirmarError: Bool = false
    @State private var paswordCError = ""
    @State private var concideError = ""
    
    var body: some View {
        ZStack{
            Group{
                NavigationLink(destination: Login(),isActive: $guardar, label: {EmptyView()})
            }
            
            Color.ui.colorWebControl
                .ignoresSafeArea()
            ZStack{
                WCLogo(name: "logoWebControl",width: 230,height: 90)
                    .padding(.top,-250)
            }
            VStack{
                WCText(titleType: .title("Cambio de contraseña"),color: .white)
                    .padding(.top,50)
                    .padding(.bottom,-10)
                WCText(titleType: .subtitle("Establesca una nueva contraseña para su cuenta"),color: .white)
                    .padding(.bottom,-10)
                TextFieldImageNot(TxtFieldType: .password("Contraseña Nueva"), text: "Contraseña Nueva", bindingVar: $contraseña)
                    .keyboardType(.alphabet)
                    .padding(.bottom,-20)
                    .onChange(of: contraseña) { newValue in
                        validateConfirmacion()
                        if !contraseña.isEmpty {
                            passwordError = false
                            mensajeError = ""
                        }
                        if contieneCaracteresEspeciales(newValue) {
                            contraseña = String(newValue.filter { $0.isLetter || $0.isNumber })
                        }
                    }
                if !mensajeError.isEmpty {
                    Text(mensajeError)
                        .foregroundColor(.red)
                        .padding(.top,-0)
                }
                TextFieldImageNot(TxtFieldType: .password("Confirmar Contraseña"), text: "Confirmar Contraseña", bindingVar: $confirmar)
                    .keyboardType(.alphabet)
                    .onChange(of: confirmar) { newValue in
                        validateConfirmacion()
                        if !confirmar.isEmpty {
                            confirmarError = false
                            paswordCError = ""
                        }
                        if contieneCaracteresEspeciales(newValue) {
                            confirmar = String(newValue.filter { $0.isLetter || $0.isNumber })
                        }
                    }
                if !paswordCError.isEmpty {
                    Text(paswordCError)
                        .foregroundColor(.red)
                        .padding(.top,-15)
                }
                if !concideError.isEmpty {
                    Text(concideError)
                        .foregroundColor(.red)
                        .padding(.top,-15)
                }
                WCButton(action: {
                    if contraseña.isEmpty && confirmar.isEmpty{
                        validatePassword()
                    }else{
                        guardar = true
                    }
                }, name: "GUARDAR",backgroundColor: .black, textColor: .white)
            }
        }
        
    }
    private func camposEstanLlenos() -> Bool {
        return contraseña.isEmpty || confirmar.isEmpty
    }
    
    func validatePassword(){
        if contraseña.isEmpty && confirmar.isEmpty{
            passwordError = true
            mensajeError = "Campo Requerido"
            confirmarError = true
            paswordCError = "Campo Requerido"
        }
        
    }
    
    
    func validateConfirmacion(){
        if contraseña.isEmpty || contraseña != confirmar {
            if confirmar == contraseña {
                concideError = ""
                passwordError = false
                print("La contraseñas son iguales")
            } else {
                concideError = "La contraseña no concide"
                passwordError = true
            }
        }else{
            concideError = ""
            passwordError = false
        }
    }
    
//    private func validarCampos() -> Bool {
//        if contraseña == confirmar {
//            mensajeError = ""
//            print("La contraseñas son iguales")
//            return true
//        } else {
//            mensajeError = "La contraseña no concide"
//            return false
//        }
//    }
}

struct ConfirmarNContrasen_a_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            ConfirmarNContrasen_a()
        } else {
            // Fallback on earlier versions
        }
    }
}
