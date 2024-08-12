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
    let db = Firestore.firestore()


    /*@Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
     */
    //@Published var user: User
    
    init () {
        uid = ""
        userLoggedIn = false;
    }
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            if let error = error as? NSError {
                print("Error: \(error.localizedDescription)")
            } else {
                self?.userSession = authResult?.user
                print("User signs in successfully")
                self?.userLoggedIn = true
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
    
    func createUser(email: String, password: String, pronouns: [String], chorePreferences: [String], availability: [String], cookingPref: [String], dietaryPref: [String], noiseLevels: [String], guestFreq: [String] = [], guestPref: [String], communicationPref: [String]) async {
        
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
        
        do {
          try await db.collection("data").document(email).setData(userData)
          print("Document successfully written!")
        } catch {
          print("Error writing document: \(error)")
        }
    }
    
    func isUserLoggedIn() -> Bool {
        print(Auth.auth().currentUser?.email ?? "No email found")
        return Auth.auth().currentUser != nil
    }

    
        /*withEmail email: String, password: String, fullname: String, pronouns: [String], chorePreferences: [String], availability: [String], cookingPref:[String], dietaryPref: [String], noiseLevels: [String], guestFreq: [String], guestPref: [String], communicationPref: [String] *///) //async throws {
        
        //do {
            /*
            let user2 = self.user
            let authDataResult = try await Auth.auth().createUser(withEmail: user2.email, password: user2.password)
            let result = AuthDataResultModel(uid: authDataResult.user.uid, email: authDataResult.user.email ?? "no email")
            
            let result = try await Auth.auth().createUser(withEmail: self.user.email, password:  self.user.password)
            self.userSession = result.user
            self.user.id = result.user.uid
            let user2 = self.user
            //let user = User(id: result.user.uid, fullname: fullname, email: email)
            guard let encodedUser = Firestore.Encoder.encode(user2) else { return }
            try await Firestore.firestore().collection("users").document(user.id)
             */
        //} catch {
            
        //}
    //}

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
}
