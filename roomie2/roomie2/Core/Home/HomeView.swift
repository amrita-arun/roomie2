//
//  HomeView.swift
//  roomie2
//
//  Created by Administrator on 8/7/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showLoginView = false
    @EnvironmentObject var user: User

    var body: some View {
        Text("Inside Home!")
        
        Button(action: {
            Task {
               viewModel.signOut()
           }
        }) {
            Text("Sign Out")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(5.0)
        }
        .padding(.top, 20)
        .onChange(of: viewModel.userLoggedIn) { loggedIn in
            if !loggedIn {
                showLoginView = true
            }
        }
        .navigationDestination(isPresented: $showLoginView) {
            LogInView()
        }
    }
    
    /*
    func populateUser() async {
        let db = Firestore.firestore()
        let docRef = db.collection("data").document(self.user.email)

        do {
          let document = try await docRef.getDocument()
          if document.exists {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Document data: \(dataDescription)")
          } else {
            print("Document does not exist")
          }
        } catch {
          print("Error getting document: \(error)")
        }
        
    }
     */
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
