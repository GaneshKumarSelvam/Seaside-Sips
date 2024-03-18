//
//  LaunchScreenView.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import SwiftUI

struct LaunchScreenView: View {

    /*
     1. launchClicked Appstorage is used for launchscreen to be showed only once.
     2. dynamicTypeSize used for the dynamic font sizing of the text
     */
    @AppStorage("launchClicked") var launchClicked: Bool = false
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        if launchClicked {
            CategoryScreenView()
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        } else {
            launchScreen
        }
    }

    
    private var launchScreen: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, .yellow]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                Image(Images.launchCocktail_Image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                    .accessibilityIdentifier(AccessibilityId.launchScreen_Image)
                
                Text(AppContents.launchScreen_Title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .overlay(alignment: .bottom, content: {
                        Capsule(style: .continuous)
                            .frame(height: 3)
                            .offset(y: 5)
                            .foregroundStyle(.white)
                    })
                    .lineLimit(2)
                    .accessibilityIdentifier(AccessibilityId.launchScreen_Title)
                
                Text(AppContents.launchScreen_Description)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .lineLimit(10)
                    .accessibilityIdentifier(AccessibilityId.launchScreen_Description)
                Spacer()
                Spacer()
            }
            .multilineTextAlignment(.center)
            .minimumScaleFactor( dynamicTypeSize.customMinScaleFactor)
            .padding(30)
            
            // button
            VStack {
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut) {
                        launchClicked = true
                    }
                    
                }, label: {
                    Text(AppContents.launchScreen_ButtonTitle)
                        .font(.headline)
                        .foregroundStyle(.purple)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(10)
                })
                .accessibilityIdentifier(AccessibilityId.launchScreen_LetsGoButton)
                
            }
            .padding(30)

        }
    }
}

#Preview {
    LaunchScreenView()
}
