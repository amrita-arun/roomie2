//
//  AddUsersView.swift
//  roomie2
//
//  Created by Administrator on 9/5/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AddUsersView: View {
       @State private var searchText: String = ""
       @State private var searchResults: [User] = []
       @EnvironmentObject var viewModel: AuthViewModel
       let houseName: String
       @State private var houseId: String? = nil
       @EnvironmentObject var user: User
       @EnvironmentObject var house: House
        @State var createHouse = false
       
       var body: some View {
           VStack {
               TextField("Search by email", text: $searchText)
                   .padding()
                   .background(Color(.secondarySystemBackground))
                   .cornerRadius(5.0)
                   .padding(.horizontal)
                   .autocapitalization(.none)
               
               Button("Search") {
                   Task {
                       await searchUsers()
                   }
               }
               .padding()
               .background(Color.blue)
               .foregroundColor(.white)
               .cornerRadius(5.0)
               
               
               List(searchResults) { newUser in
                   HStack {
                       Text(newUser.name)
                       Spacer()
                       Button("Add to House") {
                           print("User from search", newUser)
                           house.members.append(newUser)
                           newUser.houses.append(house.name)
                       }
                       .padding()
                       .background(Color.green)
                       .foregroundColor(.white)
                       .cornerRadius(5.0)
                   }
               }
           }
           .padding()
           .navigationTitle("Add Users to House")
           
           Button(action: {
               createHouse = true
               print(house.members)
               Task {
                   await viewModel.createHouse(house: house)
               }
           })
           {
               Text("Add Users")
                   .frame(maxWidth: .infinity)
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(5.0)
           }
           .navigationDestination(isPresented: $createHouse){
               MemberView(user: user, house: house)
                   .environmentObject(house)
                   .environmentObject(user)
                   .environmentObject(viewModel)
           }
           .disabled(house.members.count < 2)
       }
       
       func searchUsers() async {
           let db = Firestore.firestore()
           do {
               let querySnapshot = try await db.collection("data")
                   .whereField("email", isEqualTo: searchText)
                   .getDocuments()
               
               searchResults = querySnapshot.documents.compactMap { document in
                   try? document.data(as: User.self)
               }
               print(searchResults)
           } catch {
               print("Error searching users: \(error.localizedDescription)")
           }
       }
    
       func addUserToHouse(userId: String) async {
           do {
               if let houseId = houseId {
                   try await viewModel.addUserToHouse(houseId: houseId, userId: userId)
               }
           } catch {
               print("Error adding user to house: \(error.localizedDescription)")
           }
       }
}

struct AddUsersView_Previews: PreviewProvider {
    static var previews: some View {
        AddUsersView(houseName: "none yet")
    }
}
