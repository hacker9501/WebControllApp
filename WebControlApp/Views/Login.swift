//
//  ContentView.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI

struct Login: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var registrar: Bool = false
    
    @State private var iniciar: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Image("logoWebControl")
                    .resizable()
                    .frame(width: 230, height: 90)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom,100)
            }
            .frame(width: 400, height: 300)
            .background(.blue)
            .edgesIgnoringSafeArea(.all)
            .padding(.bottom,459)
            
            VStack{
                VStack(alignment: .leading, spacing: 6) {
                    HStack{
                        Image("icons8-touch_id")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                    HStack{
                        Text("Recordar Id").padding()
                    }
                    VStack{
                        TextField("Enter email or username", text: $email)
                            .frame(width: 330,height: 50)
                            .border(Color.gray,width: 1)
                            .cornerRadius(10)
                            .padding(.top,8)
                        TextField("Password",text: $password)
                            .frame(width: 330,height: 50)
                            .cornerRadius(10)
                            .border(Color.gray,width: 1)
                            .padding(.top,10)
                        Button(action: {
                            iniciar = true
                        }, label: {
                            Text("INGRESAR")
                                .frame(width: 300,height: 40)
                                .background(.black)
                                .cornerRadius(25)
                                .foregroundColor(.white)
                                .padding(.top,10)
                            
                        })
                        
                        //                                NavigationLink(destination: TabsViewsPatient(),isActive: $iniciar, label: {EmptyView()}).hidden()
                        
                        HStack{
                            Button(action: {
                                registrar = true
                            }, label: {
                                Text("REGISTRARSE")
                                    .foregroundColor(.black)
                            })
                        }
                        .padding()
                        //                                NavigationLink(destination: Registerdoc(),isActive: $registrar, label: {EmptyView()}).hidden()
                        Button(action: {
                            
                        }, label: {
                            Text("OLVIDE MI CONTRASEÑA")
                                .foregroundColor(.black)
                            
                        })
                    }.padding(15)
                    .frame(height: 500)
                    
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
