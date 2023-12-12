//
//  ContentView.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI
import Combine
@available(iOS 16.0, *)
struct Login: View {
    
    let limitId = 15
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var registrar: Bool = false
    @State private var isSwitchOn = false
    @State private var iniciar: Bool = false
    @State private var ayuda: Bool = false
    @State private var validacionId: Bool = false
    @State private var validacionPassword: Bool = false
    @State private var ispresent: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Group{
                    if validacionId || validacionPassword{
                        WCAlert(isPresent: $ispresent, title: "Atencion", message: "Debe de completar todos los campos", pButton: "Aceptar", sbutton: "Cancelar")
                            .transition(.move(edge: .top))
                            .padding(.top,10)
                            .zIndex(1)
                    }
                }
                Group{
                    NavigationLink(destination: Registro(),isActive: $registrar, label: {EmptyView()})
                    NavigationLink(destination: AyudaContrasen_a(),isActive: $ayuda, label: {EmptyView()})
                }
                ZStack(alignment: .top){
                    VStack{
                        headerBackgroud
                        Spacer()
                    }
                    WCLogo(name: "logoWebControl",width: 230,height: 90)
                }
                VStack{
                    VStack{
                        HStack {
                            WCImage(imageType: .named("icons8-touch_id"))
                        }
                        VStack{
                            HStack {
                                WCTextFieldText(image: "person.text.rectangle",text: "ID", bindingVar: $id)
                                    .keyboardType(.alphabet)
                                    .onReceive(Just(id)) { _ in limitText(limitId) }
                                    .onChange(of: id) { newValue in
                                        if contieneCaracteresEspeciales(newValue) {
                                            id = String(newValue.filter { $0.isLetter || $0.isNumber })
                                        }
                                    }
                                
                            }
                            HStack{
                                WCTextField(image: "lock", text: "Contraseña", bindingVar: $password)
                                    .keyboardType(.alphabet)
                                    .onChange(of: password) { newValue in
                                        if contieneCaracteresEspeciales(newValue) {
                                            password = String(newValue.filter { $0.isLetter || $0.isNumber })
                                        }
                                    }
                                
                            }
                            HStack{
                                Toggle("Recordar Id", isOn: $isSwitchOn)
                                    .padding()
                                    .onChange(of: isSwitchOn) { newValue in
                                        if newValue {
                                            UserDefaults.standard.set(id, forKey: "savedText")
                                        }
                                        if id.isEmpty{
                                            print("Esta vacio Ingrese un id \(id)")
                                            isSwitchOn = false
                                        }else{
                                            print("Id correcto \(id)")
                                        }
                                        
                                    }
                            }
                            WCButton(action: {
                                if id.isEmpty || password.isEmpty{
                                   validacionId = true
                                    ispresent = true
                                    print("hola \(validacionId)")
                                }else{
                                    
                                    registrar = true
                                    //id = ""
                                    password = ""
                                }
                            }, name: "INGRESAR",
                                     backgroundColor: Color.ui.colorWebControl, textColor: .white)
                            .padding(.bottom,10)
                            
                            WCButton(action:{
                                if id.isEmpty || password.isEmpty{
                                    validacionId = true
                                     ispresent = true
                                }else{
                                    registrar = true
                                    //id = ""
                                    password = ""
                                }
                            },name: "REGISTRARSE",textColor: .black, height: 30).bold()
                            
                            WCButton(action:{
                                    ayuda = true
                            }, name: "OLVIDE MI CONTRASEÑA",textColor: .black)
                            
                        }.padding(15)
                            .frame(width: 360,height: 380)
                        
                    }
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 3)
                    .padding(.top,40)
                }
            }
        }
        .onAppear {
            if let savedText = UserDefaults.standard.string(forKey: "savedText") {
                id = savedText
                isSwitchOn = true
            }
        }
        
    }
    
    func  limitText(_ upper: Int) {
        if id.count > upper {
            id = String(id.prefix(upper))
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            Login()
        } else {
            // Fallback on earlier versions
        }
        
    }
}
