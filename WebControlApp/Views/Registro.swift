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
    
    let flagOptions = ["🇵🇪+51", "🇨🇱", "🇩🇴", "🇦🇷", "🇧🇷"]
    @State private var selectedFlag = 0
    let limitId = 15
    @State private var idMensaje = ""
    @State private var paswordMensaje = ""
    @State private var pasword2Mensaje = ""
    @State private var telefonoMensaje = ""
    @State private var emailMensaje = ""
    
    @State private var conPasswordMensaje = ""
    @State private var id: String = ""
    @State private var registrar: Bool = false
    @State private var selectedImage: UIImage?
    @State private var password: String = ""
    @State private var password2: String = ""
    @State private var telefono: String = ""
    @State private var email: String = ""
//    @State private var validacionId: Bool = false
//    @State private var ispresent: Bool = false
    @State private var idError: Bool = false
    @State private var passwordError: Bool = false
    @State private var password2Error: Bool = false
    @State private var telefonoError: Bool = false
    @State private var emailError: Bool = false
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top){
//                Group{
//                    if validacionId {
//                        WCAlert(isPresent: $ispresent, title: "Atencion", message: "Debe de completar todos los campos", pButton: "Aceptar", sbutton: "Cancelar")
//                            .transition(.move(edge: .top))
//                            .padding(.top,10)
//                            .zIndex(1)
//                    }
//                }
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
                            WCTextFieldText(image: "person.text.rectangle", text: "ID", bindingVar: $id, showError: idError)
                                .keyboardType(.alphabet)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke(idError ? Color.red : Color.blue, lineWidth: 1))
                                .onReceive(Just(id)) { _ in limitText(limitId) }
                                .onChange(of: id) { newValue in
                                    if !id.isEmpty {
                                        idError = false
                                        idMensaje = ""
                                    }
                                    if contieneCaracteresEspeciales(newValue) {
                                        id = String(newValue.filter { $0.isLetter || $0.isNumber })
                                    }
                                }
                        }
                        if !idMensaje.isEmpty {
                            Text(idMensaje)
                                .foregroundColor(.red)
                                .padding(.top,-5)
                        }
                        HStack {
                            WCTextField(image: "lock",text: "Contraseña", bindingVar: $password, showError: passwordError)
                                .keyboardType(.alphabet)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke(passwordError ? Color.red : Color.blue, lineWidth: 1))
                                .onChange(of: password) { newValue in
                                    if !password.isEmpty {
                                        passwordError = false
                                        paswordMensaje = ""
                                    }
                                    if contieneCaracteresEspeciales(newValue) {
                                        password = String(newValue.filter { $0.isLetter || $0.isNumber })
                                    }
                                }
                        }
                        if !paswordMensaje.isEmpty {
                            Text(paswordMensaje)
                                .foregroundColor(.red)
                                .padding(.top,-5)
                        }
                        HStack {
                            WCTextField(image: "lock",text: "Confirmar Contraseña", bindingVar: $password2, showError: password2Error)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke(password2Error ? Color.red : Color.blue, lineWidth: 1))
                                .keyboardType(.alphabet)
                                .onChange(of: password2) { newValue in
                                    if !password2.isEmpty {
                                        password2Error = false
                                        pasword2Mensaje = ""
                                    }
                                    if contieneCaracteresEspeciales(newValue) {
                                        password2 = String(newValue.filter { $0.isLetter || $0.isNumber })
                                    }
                                }
                        }
                        if !pasword2Mensaje.isEmpty {
                            Text(pasword2Mensaje)
                                .foregroundColor(.red)
                                .padding(.top,-5)
                        }
                        if !conPasswordMensaje.isEmpty {
                            Text(conPasswordMensaje)
                                .foregroundColor(.red)
                                .padding(.top,-5)
                        }
                        HStack{
                            VStack{
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
                                    .padding(.top,0)
                                    .zIndex(1)
                                    WCTextFieldTelefono(text: "Celular", bindingVar: $telefono, showError: telefonoError)
                                            .keyboardType(.numberPad)
                                            .onChange(of: telefono) { newValue in
                                                if !telefono.isEmpty {
                                                    telefonoError = false
                                                    telefonoMensaje = ""
                                                }
                                                if contieneCaracteresEspeciales(newValue) {
                                                    telefono = String(newValue.filter { $0.isLetter || $0.isNumber })
                                                }
                                            }
                                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(telefonoError ? Color.red : Color.blue , lineWidth: 1))
                                }
                                if !telefonoMensaje.isEmpty {
                                    Text(telefonoMensaje)
                                        .foregroundColor(.red)
                                        .padding(.top,-5)
                                }
                            }
                        }
                        
                        HStack {
                            VStack{
                                WCTextFieldCampo(image: "envelope", text: "Dirección de correo electronico", bindingVar: $email, showError: emailError)
                                    .keyboardType(.emailAddress)
                                    .onChange(of: email) { newValue in
                                        if !email.isEmpty {
                                            emailError = false
                                            emailMensaje = ""
                                        }
                                       
                                    }
                                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(emailError ? Color.red : Color.blue , lineWidth: 1))
                                if !emailMensaje.isEmpty {
                                    Text(emailMensaje)
                                        .foregroundColor(.red)
                                        .padding(.top,-5)
                                }
                            }
                        }
                        
                        WCButton(action: {
                            validateFields()
                            if !idError && !emailError && !telefonoError {
                                if password2.isEmpty || password2 != password{
                                    if password == password2 {
                                    conPasswordMensaje = ""
                                    print("La contraseñas son iguales")
                                    registrar = true
                                } else {
                                    conPasswordMensaje = "La contraseña no concide"
                                    registrar = false
                                }
                                }else{
                                    conPasswordMensaje = ""
                                    registrar = true
                                }
                            }
                             else {
                                registrar = false
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
    
    private func validateFields() {
        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
        
        if id.isEmpty && email.isEmpty && telefono.isEmpty && password.isEmpty && password2.isEmpty{
            
            idError = true
            passwordError = true
            password2Error = true
            emailError = true
            telefonoError = true
            
            idMensaje = "Campo Requerido"
            paswordMensaje = "Campo Requerido"
            pasword2Mensaje = "Campo Requerido"
            telefonoMensaje = "Campo Requerido"
            emailMensaje = "Campo Requerido"
            
        } else if id.isEmpty {
            idError = true
            idMensaje = "Campo Requerido"
            print("Campo requerido en 'id'")
        }else if email.isEmpty{
            emailError = true
            emailMensaje = "Campo Requerido"
            print("Campo requerido en 'password'")
        }else if telefono.isEmpty {
            telefonoError = true
            telefonoMensaje = "Campo Requerido"
            print("Campo requerido en 'password'")
        }else if !isValidEmail(email) {
            emailError = true
            emailMensaje = "Formato de correo electrónico no válido"
            print("Formato de correo electrónico no válido")
        }
//        else if password2.isEmpty || password2 != password {
//            if password == password2 {
//                conPasswordMensaje = ""
//                print("La contraseñas son iguales")
//            } else {
//                conPasswordMensaje = "La contraseña no concide"
//            }
//        }
        
    }
    
    
    
//    private func camposEstanLlenos() -> Bool {
//        return id.isEmpty || password.isEmpty || email.isEmpty || telefono.isEmpty || password.isEmpty
//    }
    
    private func limpiarCampos(){
        id = ""
        password = ""
        password2 = ""
        email = ""
        telefono = ""
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
