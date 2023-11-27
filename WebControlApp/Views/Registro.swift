//
//  Registro.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI

struct Registro: View {
    
    @State private var id: String = ""
    @State private var registrar: Bool = false
    @State private var selectedImage: UIImage?
    
    @State private var iniciar: Bool = false
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top){
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
                            FloatingTitleTextField(placeholder: "ID", text: $id)
                        }
                        HStack {
                            WCTextField(image: "person", text: "Contraseña")
                        }
                        HStack {
                            WCTextField(image: "person", text: "Contraseña")
                        }
                        HStack{
                            Image("bandera")
                                .resizable()
                                .frame(width: 30, height: 20)
                                .padding(.bottom,30)
                            HStack {
                                WCTextFieldText(image: "phone.fill", width: 280, text: "Celular")
                            }
                        }
                        HStack {
                            WCTextFieldText(image: "envelope", text: "Dirección de correo electronico")
                        }
                        WCButton(name: "REGISTRAR",backgroundColor: Color.ui.colorWebControl,textColor: .white)
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

}

struct Registro_Previews: PreviewProvider {
    static var previews: some View {
        Registro()
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let colorWebControl = Color("ColorWC")
    }
}
