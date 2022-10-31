//
//  ContentView.swift
//  Gamers
//
//  Created by Raúl Baltazar Domínguez on 25/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Spacer()
            
            Color(.white).ignoresSafeArea()

            VStack{
                
                Image("minecraftGreen").resizable().aspectRatio( contentMode: .fit).frame(width: 90).padding(.bottom , 42)
                
                InicioYRegistroView()
            }
                
        }
    }
}

struct InicioYRegistroView:View {
    @State var tipoInicioSesion = true
    var body: some View {
        
        VStack{
            
            
            HStack {
                Spacer()
                
                Button("INICIAR SESIÓN") {
                    
                    tipoInicioSesion = true
                    print("Pantalla Inicio Sesión")
                }.foregroundColor(tipoInicioSesion ? .black : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    
                    tipoInicioSesion = false
                    print("Pantalla Regístrate")
                }.foregroundColor(tipoInicioSesion ? .gray : .black)
                
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true {
                
                InicioSesionView()
                
            } else {
                
                RegistroView()
            }
            
        }
    }
}

struct InicioSesionView: View {
    
    @State var correo = ""
    @State var contraseña = ""

    
    var body: some View {
        
        ScrollView {
            
            
            VStack(alignment: .leading) {
                
                Text("Correo Electronico").foregroundColor(Color("Dark-Cian"))
                
                
                ZStack(alignment: .leading) {
                    
                    
                    if correo.isEmpty {
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(.gray))
                    }
                    
                    TextField("", text: $correo)
                    
                }
                
                Divider().frame( height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Password").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading) {
                    
                    
                    if contraseña.isEmpty {
                        Text("Password").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contraseña)
                    
                }
                
                Divider().frame( height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("Dark-Cian")).padding(.bottom)
                
                Button(action: iniciarSesion, label: {Text("INICIAR SESIÓN") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6) )
                
                
                Text("Inicia sesión con redes sociales").foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 90, leading: 0, bottom: 11, trailing: 0))
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: iniciarSesion, label: {Text("Facebook") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6) )
                    
                    Spacer()
                    
                    Button(action: iniciarSesionTwitter, label: {Text("Twitter") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6) )
                    
                    Spacer()
                }
                
            }.padding(.horizontal, 77.0)
        }
    }
}

func iniciarSesion() {
    print("Estoy iniciando sesión")
}

func iniciarSesionFacebook() {
    print("Estoy iniciando sesión con Facebook")
}

func iniciarSesionTwitter() {
    print("Estoy iniciando sesión con Twitter")
}

struct RegistroView: View{
    var body: some View {
        
        Text("Soy la vista de Registro")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        Image("pantalla2")
    }
}
