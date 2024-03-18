//
//  CategoryScreenView.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import SwiftUI

struct CategoryScreenView: View {
    
    var homeScrenViewModel = HomeScreenViewModel(homeScreenArray:[
        HomeScreenModel(type: .alcoholic, image: Image(Images.alcoholic_Image), title: AppContents.alcoholic, description: AppContents.alcoholic_Description),
        HomeScreenModel(type: .nonAlcoholic, image: Image(Images.NonAlcoholic_Image), title: AppContents.nonAlcoholic, description: AppContents.nonAlcoholic_Description),
        HomeScreenModel(type: .search, image: Image(Images.searchDrinks_Image), title: AppContents.search, description: AppContents.search_Description)]
    )
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(homeScrenViewModel.homeScreenArray) { homeScreenModel in
                    
                    NavigationLink {
                        if homeScreenModel.type == .search {
                            SearchDrinkView(homeScreenModel: homeScreenModel)
                        } else {
                            DrinkListView(homeScreenModel: homeScreenModel)
                        }
                    } label: {
                        VStack {
                            homeScreenModel.image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(homeScreenModel.title)
                                    .font(.headline)
                                
                                Text(homeScreenModel.description)
                                    .font(.caption)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .font(.title)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .listRowSeparator(.hidden)
                }
            }
            .accessibilityIdentifier(AccessibilityId.categoryScreen_List)
            .listStyle(.plain)
            .navigationTitle(AppContents.appName)
        }
    }
}

#Preview {
    CategoryScreenView()
}
