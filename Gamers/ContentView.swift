//
//  ContentView.swift
//  Gamers
//
//  Created by Raúl Baltazar Domínguez on 25/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Spacer()
                
                Color("crema").ignoresSafeArea()

                VStack{
                    
                    Image("Image").resizable().aspectRatio( contentMode: .fit).frame(width: 100).padding(.bottom , 20)
                    
                    InicioYRegistroView()
                }
                    
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
    @State var isPantallaActive = false

    
    var body: some View {
        
        ScrollView {
            
            
            VStack(alignment: .leading) {
                
                Text("Correo Electronico").foregroundColor(.black)
                
                
                ZStack(alignment: .leading) {
                    
                    
                    if correo.isEmpty {
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(.gray))
                    }
                    
                    TextField("", text: $correo)
                    
                }
                
                Divider().frame( height: 1).background(.black).padding(.bottom)
                
                Text("Password").foregroundColor(.black)
                
                ZStack(alignment: .leading) {
                    
                    
                    if contraseña.isEmpty {
                        Text("Password").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contraseña)
                    
                }
                
                Divider().frame( height: 1).background(.black).padding(.bottom)
                
                Text("Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(.black).padding(.bottom)
                
                Button(action: iniciarSesion, label: {Text("INICIAR SESIÓN") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(.black, lineWidth: 1.0).shadow(color: .white, radius: 6) )
                
                
                Text("Inicia sesión con redes sociales").foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 90, leading: 0, bottom: 11, trailing: 0))
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: iniciarSesion, label: {Text("Facebook") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(.black, lineWidth: 1.0).shadow(color: .white, radius: 6) )
                    
                    Spacer()
                    
                    Button(action: iniciarSesionTwitter, label: {Text("Twitter") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(.black, lineWidth: 1.0).shadow(color: .white, radius: 6) )
                    
                    Spacer()
                }
                
            }.padding(.horizontal, 77.0)
            
            
            NavigationLink(destination: Home(), isActive: $isPantallaActive, label: {
                EmptyView()
            })
        }
    }
    
    func iniciarSesion() {
        print("Estoy iniciando sesión")
        
        isPantallaActive = true
    }
    
    
}


func iniciarSesionFacebook() {
    print("Estoy iniciando sesión con Facebook")
}

func iniciarSesionTwitter() {
    print("Estoy iniciando sesión con Twitter")
}

func registrate() {
    print("Estoy registradonme")
}

struct RegistroView: View{
    
    @State var correo = ""
    @State var contraseña = ""
    @State var confirmarContraseña = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .center) {
                
                VStack{
                
                Text("Elige una foto de perfil").fontWeight(.bold).foregroundColor(.black)
                
                Text("Puedes cambiarla o elegirla más adelante").font(.footnote).foregroundColor(.black).fontWeight(.light).padding(.bottom)
                
                Button(action: tomarFoto, label: {
                    
                    ZStack {
                        Image("boy").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                        
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                    
                    
                }).padding(.bottom)
                
                VStack(alignment: .leading) {
                    
                    Text("Correo Electronico").foregroundColor(.black)
                    
                    
                    ZStack(alignment: .leading) {
                        
                        
                        if correo.isEmpty {
                            Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(.gray))
                        }
                        
                        TextField("", text: $correo)
                        
                    }
                    
                    Divider().frame( height: 1).background(.black).padding(.bottom)
                    
                    Text("Contraseña").foregroundColor(.black)
                    
                    
                    ZStack(alignment: .leading) {
                        
                        
                        if contraseña.isEmpty {
                            Text("Escribe tu contraseña").font(.caption).foregroundColor(Color(.gray))
                        }
                        
                        SecureField("", text: $contraseña)
                        
                    }
                    
                    Divider().frame( height: 1).background(.black).padding(.bottom)
                    
                    Text("Confirmar Contraseña").foregroundColor(.black)
                    
                    ZStack(alignment: .leading) {
                        
                        
                        if confirmarContraseña.isEmpty {
                            Text("Vuelve a escribir tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $confirmarContraseña)
                        
                    }
                    
                    Divider().frame( height: 1).background(.black).padding(.bottom)
                    
                    
                }
                    
                    
                    Button(action: registrate, label: {Text("REGÍSTRATE") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(.black, lineWidth: 1.0).shadow(color: .white, radius: 6) )
                    
                    
                    Text("Inicia sesión con redes sociales").foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 10, leading: 0, bottom: 11, trailing: 0))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: iniciarSesionFacebook, label: {Text("Facebook") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 6, leading: 18, bottom: 10, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(.black, lineWidth: 1.0).shadow(color: .white, radius: 6) )
                        
                        Spacer()
                        
                        Button(action: iniciarSesionTwitter, label: {Text("Twitter") }).fontWeight(.bold).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 6, leading: 18, bottom: 10, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(.black), lineWidth: 1.0).shadow(color: .white, radius: 6) )
                        
                        Spacer()
                    }
                    
                }.padding(.horizontal, 50.00)
                
                
                
            }
            
            
            
        }
        
    }
}

func tomarFoto() {
    print("Voy a tomar fotografia de perfil")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        Image("pantalla2")
    }
}
