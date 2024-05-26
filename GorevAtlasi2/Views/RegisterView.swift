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
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Animated Icon
                Image(systemName: "person.crop.circle.fill.badge.plus")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                
                TextField("Kullanıcı Adı", text: $username)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding([.leading, .trailing, .top], 20)
                
                TextField("E-posta", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding([.leading, .trailing, .top], 20)
                
                SecureField("Şifre", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding([.leading, .trailing, .top], 20)
                
                Button(action: {
                    // Kayıt olma işlemleri burada gerçekleştirilecek
                }) {
                    Text("Kayıt Ol")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing, .top], 20)
                
                HStack {
                    NavigationLink(destination: LoginView()) {
                        Text("Hesabınız var mı? Giriş Yap")
                            .foregroundColor(.white)
                            .underline()
                    }
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .onAppear {
            self.isAnimating = true
        }
    }
}

#Preview {
    RegisterView()
}

