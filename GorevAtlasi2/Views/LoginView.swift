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
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Animated Icon
                Image(systemName: "person.crop.circle.fill")
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
                
                SecureField("Şifre", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding([.leading, .trailing, .top], 20)
                
                Button(action: {
                    // Giriş yapma işlemleri burada gerçekleştirilecek
                }) {
                    Text("Giriş Yap")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing, .top], 20)
                
                HStack {
                    NavigationLink(destination: RegisterView()) {
                        Text("Hesabınız yok mu? Kayıt Ol")
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
    LoginView()
}

