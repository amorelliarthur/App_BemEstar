//
//  NavigationBar.swift
//  App_BemEstar
//
//  Created by user288583 on 11/30/25.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var selectedName: String

    @State private var showAlert = false
    @State private var nomeNovo = ""
    @State private var senhaNova = ""

    // Lista de usuários
    //@State private var users: [LoginType] = mockUsers + LoginStorage.loadUsers()
    @State private var users: [LoginType] = {
        let saved = LoginStorage.loadUsers()
        return saved.isEmpty ? mockUsers : saved
    }()

    var body: some View {
        HStack(spacing: 8) {

            // Menu de seleção de nome
            Menu {
                ForEach(users, id: \.username) { user in
                    Button(user.username) {
                        selectedName = user.username
                    }
                }
            } label: {
                Text(selectedName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }

            // Botão de adicionar usuário
            Button(action: { showAlert = true }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.gray)
            }
            .sheet(isPresented: $showAlert) {
                VStack(spacing: 16) {

                    Text("Adicionar novo usuário")
                        .font(.headline)

                    TextField("Digite o nome", text: $nomeNovo)
                        .textFieldStyle(.roundedBorder)

                    SecureField("Digite a senha", text: $senhaNova)
                        .textFieldStyle(.roundedBorder)

                    HStack(spacing: 24) {
                        Button("Cancelar") {
                            showAlert = false
                            nomeNovo = ""
                            senhaNova = ""
                        }
                        .foregroundStyle(.red)

                        Button("Adicionar") {
                            if !nomeNovo.isEmpty && !senhaNova.isEmpty {
                                let novoUser = LoginType(
                                    username: nomeNovo, password: senhaNova)
                                users.append(novoUser)
                                selectedName = nomeNovo

                                // Salva todos os usuários no UserDefaults
                                LoginStorage.saveUsers(users)

                                nomeNovo = ""
                                senhaNova = ""
                                showAlert = false
                            }
                        }
                        .foregroundStyle(.blue)
                    }
                }
                .padding()
                .presentationDetents([.fraction(0.25)])
            }
        }
    }
}

#Preview {
    // Limpa os usuários salvos apenas no Preview
    let _ = UserDefaults.standard.removeObject(forKey: "savedUsers")
    NavigationBar(selectedName: .constant("Arthur Dias"))
}
