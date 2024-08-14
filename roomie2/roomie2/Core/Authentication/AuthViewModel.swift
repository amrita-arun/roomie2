//
//  AuthenticationViewModel.swift
//  roomie2
//
//  Created by Administrator on 8/7/24.
//
//  AuthViewModel.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth

class AuthViewModel: ObservableObject {
    var uid: String
    @Published var userLoggedIn: Bool = false
    @Published var userSession: FirebaseAuth.User?
    @Published var user: User?
    let db = Firestore.firestore()


    /*@Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
     */
    //@Published var user: User
    
    init () {
        uid = ""
        if (isUserLoggedIn()) {
            userLoggedIn = true;
        }
        else {
            userLoggedIn = false;
        }
    }
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            if let error = error as? NSError {
                print("Error: \(error.localizedDescription)")
                return
            } else {
                self?.userSession = authResult?.user
                print("User signs in successfully")
                self?.userLoggedIn = true
                
            }
            Task {
                var description = await self?.populateUser(email: email)
                
            }
        }
    

        /*
        
        if isUserLoggedIn() {
            userLoggedIn = true
            print("user logged in")
        } else {
            userLoggedIn = false
            print("user not logged in")
        }
         */
    }
    
    func createUser(email: String, password: String, pronouns: [String], chorePreferences: [String], availability: [String], cookingPref: [String], dietaryPref: [String], noiseLevels: [String], guestFreq: [String] = [], guestPref: [String], communicationPref: [String], user2: User) async {
        self.user = user2
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print("Couldn't complete sign up")
                print("Error signing up: %@", error!)
          } else {
            print("User signs up successfully")
              self.userLoggedIn = true
          }
            
        }

        /*
        if isUserLoggedIn() {
            userLoggedIn = true
            print("user logged in")
        } else {
            userLoggedIn = false
            print("user not logged in")
        }
         */
        
        /*
        let userData: [String: Any] = [
          "pronouns": pronouns,
          "chorePrefs": chorePreferences,
          "availability": availability,
          "cookingPref": cookingPref,
          "dietaryPref": dietaryPref,
          "noiseLevels": noiseLevels,
          "guestFreq": guestFreq,
          "communicationPref": communicationPref
        ]
         */
        
        self.user = user2
        
        do {
            try await db.collection("data").document(email).setData(from: self.user)
          print("Document successfully written!")
        } catch {
          print("Error writing document: \(error)")
        }
        
        
        Task {
            await self.populateUser(email: email)
            
        }
         
    }
    
    func isUserLoggedIn() -> Bool {
        print(Auth.auth().currentUser?.email ?? "No email found")
        return Auth.auth().currentUser != nil
    }

    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            userLoggedIn = false
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        
    }
    
    func populateUser(email: String) async -> String{
        let db = Firestore.firestore()
        let docRef = db.collection("data").document(email)
        var newUser = User()
        print("email:", email)
        do {
            let newUser = try await docRef.getDocument(as: User.self)
            print("User: \(newUser)")
            
            DispatchQueue.main.async {
                self.user = newUser
            }
            //print(user ?? "unable to convert user to string")
        } catch {
            print("Error decoding user: \(error)")
            return ""
        }
        //user = newUser


        /*
        do {
          let document = try await docRef.getDocument()
          if document.exists {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Document data: \(dataDescription)")
              return dataDescription
          } else {
            print("Document does not exist")
          }
        } catch {
          print("Error getting document: \(error)")
        }
         */
        return "No data retrieved"
    }
    
    func getUserEmail() -> String {
        if (userLoggedIn) {
            return Auth.auth().currentUser?.email ?? "No email found"
        }
        return "User not logged in"
    }
}
