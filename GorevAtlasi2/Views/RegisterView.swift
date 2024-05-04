//
//  RegisterView.swift
//  GorevAtlasi2
//
//  Created by Zehra Öner on 4.05.2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Kullanıcı Adı", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("E-posta", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Şifre", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Kayıt Ol") {
                // Kayıt olma işlemleri burada gerçekleştirilecek
            }
            .padding()
            HStack {
                NavigationLink(destination: LoginView()) {
                    Text("Hesabınız var mı? Giriş Yap")
                }

                       }
        }
        .padding()
    }
}
#Preview {
    RegisterView()
}
