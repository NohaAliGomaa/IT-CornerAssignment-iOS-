//
//  LeanyApp.swift
//  Leany
//
//  Created by Ahmed Fareed on 01/01/2023.
//

import SwiftUI

@main
struct LeanyApp: App {
    init() {
          let appearance = UINavigationBarAppearance()

          appearance.configureWithOpaqueBackground()
          appearance.backgroundColor = UIColor.orange

          appearance.titleTextAttributes = [
              .foregroundColor: UIColor.white
          ]

          appearance.largeTitleTextAttributes = [
              .foregroundColor: UIColor.white
          ]

          UINavigationBar.appearance().standardAppearance = appearance
          UINavigationBar.appearance().scrollEdgeAppearance = appearance
          UINavigationBar.appearance().compactAppearance = appearance

          UINavigationBar.appearance().tintColor = .white
        
      }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
