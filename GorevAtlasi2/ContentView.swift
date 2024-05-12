//
//  ContentView.swift
//  GorevAtlasi2
//
//  Created by Zehra Öner on 2.04.2024.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hoş Geldiniz")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: LoginView()) {
                    Text("Hesabınız var mı? Giriş yapın")
                        .foregroundColor(.blue)
                }
                .padding()
                
                NavigationLink(destination: RegisterView()) {
                    Text("Kayıtlı değil misiniz? Kayıt olun")
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .navigationBarTitle("GÖREV ATLASI")
            .navigationBarHidden(true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
