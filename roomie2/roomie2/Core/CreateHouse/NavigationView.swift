//
//  NavigationView.swift
//  roomie2
//
//  Created by Administrator on 9/9/24.
//

import SwiftUI

struct NavigationView: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var house: House
    
    var body: some View {
        TabView {
            HomeView(user: user)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }

            MemberView(user: user, house: house)
                .tabItem {
                    Label("Members", systemImage: "person.3.fill")
                }
            
            GroceryListView()
                .tabItem {
                    Label("Grocery List", systemImage: "cart.badge.plus")
                }
            
            ProfileView(user: user)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }

        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
