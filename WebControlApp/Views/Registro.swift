//
//  Registro.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI
import Combine
@available(iOS 16.0, *)
struct Registro: View {
    
    @ObservedObject var emailValidacion = WCCampoValidacion()
    @ObservedObject var otherValidacion = WCCampoValidacion()
    let flagOptions = ["🇵🇪+51", "🇨🇱", "🇩🇴", "🇦🇷", "🇧🇷"]
    @State private var selectedFlag = 0
    let limitId = 15
    @State private var mensajeError = ""
    @State private var id: String = ""
    @State private var registrar: Bool = false
    @State private var selectedImage: UIImage?
    @State private var password: String = ""
    @State private var password2: String = ""
    @State private var telefono: String = ""
    @State private var email: String = ""
    @State private var validacionId: Bool = false
    @State private var ispresent: Bool = false
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top){
                Group{
                    if validacionId {
                        WCAlert(isPresent: $ispresent, title: "Atencion", message: "Debe de completar todos los campos", pButton: "Aceptar", sbutton: "Cancelar")
                            .transition(.move(edge: .top))
                            .padding(.top,10)
                            .zIndex(1)
                    }
                }
                Group{
                    NavigationLink(destination: Login(),isActive: $registrar, label: {EmptyView()})
                }
                VStack{
                    headerBackgroud
                    Spacer()
                }
                WCLogo(name: "logoWebControl",width: 230,height: 90)
                
            }
            VStack{
                VStack {
                    HStack{
                        WCImage(imageType: .system("person.circle"))
                            .foregroundColor(Color.ui.colorWebControl)
                    }
                    VStack{
                        HStack {
                            WCTextFieldText(image: "person.text.rectangle", text: "ID", bindingVar: $id)
                                .keyboardType(.alphabet)
                                .onReceive(Just(id)) { _ in limitText(limitId) }
                                .onChange(of: id) { newValue in
                                    if contieneCaracteresEspeciales(newValue) {
                                        id = String(newValue.filter { $0.isLetter || $0.isNumber })
                                    }
                                }
                        }
                        HStack {
                            WCTextField(image: "lock",text: "Contraseña", bindingVar: $password)
                                .keyboardType(.alphabet)
                                .onChange(of: password) { newValue in
                                    if contieneCaracteresEspeciales(newValue) {
                                        password = String(newValue.filter { $0.isLetter || $0.isNumber })
                                    }
                                }
                        }
                        HStack {
                            WCTextField(image: "lock",text: "Confirmar Contraseña", bindingVar: $password2)
                                .keyboardType(.alphabet)
                                .onChange(of: password2) { newValue in
                                    if contieneCaracteresEspeciales(newValue) {
                                        password2 = String(newValue.filter { $0.isLetter || $0.isNumber })
                                    }
                                }
                        }
                        if !mensajeError.isEmpty {
                            Text(mensajeError)
                                .foregroundColor(.red)
                                .padding(.top,-15)
                        }
                        HStack{
                            HStack{
                                Picker("Bandera", selection: $selectedFlag) {
                                    ForEach(0..<flagOptions.count) { index in
                                        Text(flagOptions[index])
                                            .tag(index)
                                    }
                                }
                                .frame(width: 100)
                                .pickerStyle(MenuPickerStyle())
                                .padding(.leading,10)
                                .padding(.trailing,-150)
                                .padding(.top,-15)
                                .zIndex(1)
                                WCTextFieldCampo(text: "Celular", bindingVar: $telefono, validacion: otherValidacion)
                                        .keyboardType(.numberPad)
            
                            }
                        }
                        HStack {
                            WCTextFieldCampo(image: "envelope", text: "Dirección de correo electronico", bindingVar: $email, validacion: emailValidacion)
                                .keyboardType(.emailAddress)
                        }
                        WCButton(action: {
                            emailValidacion.validate()
                            otherValidacion.validate()
                            if camposEstanLlenos(){
                                validacionId = true
                                 ispresent = true
                            }else if !validarCampos(){
                                registrar = false
                            }else{
                                limpiarCampos()
                                registrar = true
                            }
                        }, name: "REGISTRAR",backgroundColor: Color.ui.colorWebControl,textColor: .white)
                        .padding(.bottom)
                    }.padding(15)
                    .frame(width: 360,height: 420)
                    
                }
                .background(.white)
                .cornerRadius(25)
                .shadow(radius: 3)
                .padding(.top,40)
            }
        }
    }
    
    private func camposEstanLlenos() -> Bool {
        return id.isEmpty || password.isEmpty || email.isEmpty || telefono.isEmpty || password.isEmpty
    }
    
    private func limpiarCampos(){
        id = ""
        password = ""
        password2 = ""
        email = ""
        telefono = ""
    }
    
    private func validarCampos() -> Bool {
        if password == password2 {
            mensajeError = ""
            print("La contraseñas son iguales")
            return true
        } else {
            mensajeError = "La contraseña no concide"
            return false
        }
    }

    func  limitText(_ upper: Int) {
        if id.count > upper {
            id = String(id.prefix(upper))
        }
    }

}



struct Registro_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            Registro()
        } else {
            // Fallback on earlier versions
        }
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let colorWebControl = Color("ColorWC")
    }
}
