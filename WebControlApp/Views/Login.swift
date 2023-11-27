//
//  ContentView.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI

struct Login: View {
    
    @State private var id: String = ""
    @State private var email: String = ""
    @State private var registrar: Bool = false
    @State private var isSwitchOn = false
    @State private var iniciar: Bool = false
    @State private var ayuda: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
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
                                
                                FloatingTitleTextField(placeholder: "ID", text: $id)
                                
                            }
                            HStack{
                                WCTextField(image: "lock", text: "Contraseña")
                            }
                            
                            HStack{
                                Toggle("Recordar Id", isOn: $isSwitchOn)
                                    .padding()
                            }
                            WCButton(name: "INGRESAR",
                                     backgroundColor: Color.ui.colorWebControl, textColor: .white)
                            WCButton(name: "REGISTRARSE",textColor: .black, height: 30).bold()
                            WCButton(name: "OLVIDE MI CONTRASEÑA",textColor: .black)
                            
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
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Login()
        }
    }
}
