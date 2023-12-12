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
    @State private var mensajeError = ""
    
    var body: some View {
        ZStack{
            Group{
                NavigationLink(destination: Login(),isActive: $guardar, label: {EmptyView()})
            }
            
            Color.ui.colorWebControl
                .ignoresSafeArea()
            VStack{
                WCLogo(name: "logoWebControl",width: 230,height: 90)
                WCText(titleType: .title("Cambio de contraseña"),color: .white)
                WCText(titleType: .subtitle("Establesca una nueva contraseña para su cuenta"),color: .white)
                
                TextFieldImageNot(TxtFieldType: .password("Contraseña Nueva"), text: "Contraseña Nueva", bindingVar: $contraseña)
                    .keyboardType(.alphabet)
                    .padding(.bottom,-20)
                    .onChange(of: contraseña) { newValue in
                        if contieneCaracteresEspeciales(newValue) {
                            contraseña = String(newValue.filter { $0.isLetter || $0.isNumber })
                        }
                    }
                
                TextFieldImageNot(TxtFieldType: .password("Confirmar Contraseña"), text: "Confirmar Contraseña", bindingVar: $confirmar)
                    .keyboardType(.alphabet)
                    .onChange(of: confirmar) { newValue in
                        if contieneCaracteresEspeciales(newValue) {
                            confirmar = String(newValue.filter { $0.isLetter || $0.isNumber })
                        }
                    }
                if !mensajeError.isEmpty {
                    Text(mensajeError)
                        .foregroundColor(.red)
                        .padding(.top,-15)
                }
                WCButton(action: {
                    if camposEstanLlenos(){
                        
                    }else if !validarCampos(){
                        guardar = false
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
    
    private func validarCampos() -> Bool {
        if contraseña == confirmar {
            mensajeError = ""
            print("La contraseñas son iguales")
            return true
        } else {
            mensajeError = "La contraseña no concide"
            return false
        }
    }
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
