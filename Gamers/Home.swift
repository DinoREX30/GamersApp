//
//  Home.swift
//  Gamers
//
//  Created by Raúl Baltazar Domínguez on 03/11/22.
//

import SwiftUI

struct Home: View {
    
    @State var tableSeleccionado:Int = 2
    
    var body: some View {
        
        TabView(selection: $tableSeleccionado) {
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3)
            
            Text("Pantalla Juegos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1)
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0)
            
            PantallaHome().tabItem {
                
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2)
        }.accentColor(Color("Dark-Cian"))
        
    }
    
    init(){
            
            UITabBar.appearance().unselectedItemTintColor = UIColor.black
            UITabBar.appearance().isTranslucent = true
            
            print("Iniciando las vistas de home")
            
    }
    
}


struct PantallaHome: View {
    
    @State var textoBusqueda = ""
    
    var body: some View {
        
        ZStack {
            
            Color("crema").ignoresSafeArea()
            
            VStack {
                
                
                HStack {
                    
                    Button(action: busqueda, label: {
                        
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color("crema") : Color(.gray))
                        
                    })
                    
                    ZStack(alignment: .leading) {
                        
                        if textoBusqueda.isEmpty {
                            Text("Buscar un video").foregroundColor(Color("crema"))
                        }
                        
                        TextField("", text: $textoBusqueda).foregroundColor(Color("crema"))
                        
                    }
                    
                }.padding([.top,.leading,.bottom], 11.0).background(Color(.black)).clipShape(Capsule())
                
                
                ScrollView(showsIndicators: false){
                    
                    SubModuloHome()
                    
                }
                
            }.padding(.horizontal, 18.0)
            
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
    }
    
    func busqueda() {
        print("El usuario está buscando \(textoBusqueda)")
    }
}


struct SubModuloHome:View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        
        VStack{
            
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.black).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                    
                }, label: {
                    
                    VStack(spacing: 0){
                        
                        Image("theWitcher").resizable().scaledToFill()
                        
                        Text("The Witcher 3").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).background(Color(.black)).foregroundColor(Color("crema"))
                        
                    }
                    
                })
                
                
                Image(systemName: "play.circle.fill").resizable().frame(width: 42, height: 42)
                
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.vertical)
            
        }
        
    }
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
