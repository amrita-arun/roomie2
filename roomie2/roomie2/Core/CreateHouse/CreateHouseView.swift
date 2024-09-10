//
//  CreateHouseView.swift
//  roomie2
//
//  Created by Administrator on 8/20/24.
//

import SwiftUI

struct CreateHouseView: View {
    @State private var houseName: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var house: House
    @EnvironmentObject var user: User
    @State private var showAddUsers = false

    
    var body: some View {
        //NavigationStack {
            VStack {
                TextField("House Name", text: $house.name)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                
                Button(action: {
                    showAddUsers = true
                    print("showAddUsers is true")
                    user.house = house.name
                    house.createdBy = user
                    house.members.removeAll()
                    house.members.append(user)
                }) {
                    Text("Add Users")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                }
                .navigationDestination(isPresented: $showAddUsers) {
                    AddUsersView(houseName: house.name)
                        .environmentObject(viewModel)
                        .environmentObject(house)
                        .environmentObject(user)
                }
                .padding(.top, 20)
                
                /*
                Button("Create House") {
                    AddUsersView(houseName: house.name)
                        .environmentObject(viewModel)
                        .environmentObject(user)
                }
                .navigationDestination(isPresented: , destination: <#T##(Hashable) -> View#>)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(5.0)
                 */
                
                /*
                Button("Create House") {
                    Task {
                        try await viewModel.createHouse(name: "house 1")
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(5.0)
                 */
            }
            .padding()
        }
    
        
   // }
}




struct CreateHouseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHouseView()
    }
}
