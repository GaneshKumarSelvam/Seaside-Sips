//
//  DrinkListView.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import SwiftUI

struct DrinkListView: View {
    
    let homeScreenModel: HomeScreenModel
    @State var viewModel: DrinkListViewModel = DrinkListViewModel(serviceCoordinator: ServiceCoordinator())
    
    var body: some View {
        ZStack {
            if viewModel.loading {
                ProgressView(AppContents.loadingText)
                    .tint(.orange)
                    .foregroundColor(.gray)
                    .accessibilityIdentifier(AccessibilityId.drinkListScreen_Progress)
            } else {
                listView
                    .overlay {
                        if viewModel.drinkModelArray.isEmpty {
                            ContentUnavailableView(
                                AppContents.noDataFoundText,
                                systemImage: Images.noDataFoundSystemImage,
                                description: Text(AppContents.noDataFound_Description))
                            .accessibilityIdentifier(AccessibilityId.drinkListScreen_ContentUnavailable)
                        }
                    }
            }
        }
        .onAppear {
            viewModel.fetchDrinks(type: homeScreenModel.type)
        }
        
        .navigationTitle(homeScreenModel.title)
    }
    
    private var listView: some View {
        
        let gridLayout: [GridItem] = [GridItem(.adaptive(minimum: 100)), GridItem(.flexible()) ]
        
        return ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                
                ForEach(viewModel.drinkModelArray.indices, id: \.self) { index in
                    let drinkModel = viewModel.drinkModelArray[index]
                    NavigationLink {
                        DrinkDetailView(drinkModel: drinkModel)
                    } label: {
                        DrinkRowView(drinkModel: drinkModel)
                            .accessibilityIdentifier(String(format: AccessibilityId.drinkListScreen_DrinkRow, String(index)))
                    }
                }
            }
            .accessibilityIdentifier(AccessibilityId.drinkListScreen_List)
            .padding(.all, 10)
        }
    }
}

#Preview {
    DrinkListView(homeScreenModel: HomeScreenModel(type: .alcoholic, image: Image(Images.alcoholic_Image), title: "Title", description: "Description"))
}
