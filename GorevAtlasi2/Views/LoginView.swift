//
//  LoginView.swift
//  GorevAtlasi2
//
//  Created by Zehra Öner on 4.05.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Kullanıcı Adı", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Şifre", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Giriş Yap") {
                // Giriş yapma işlemleri burada gerçekleştirilecek
            }
            .padding()
            HStack {
                NavigationLink(destination: RegisterView()) {
                    Text("Hesabınız yok mu? Kayıt Ol")
                }
                       }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
