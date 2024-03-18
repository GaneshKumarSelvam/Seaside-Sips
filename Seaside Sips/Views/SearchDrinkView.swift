//
//  SearchDrinkView.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import SwiftUI

struct SearchDrinkView: View {
    let homeScreenModel: HomeScreenModel
    @State var viewModel: SearchDrinkViewModel = SearchDrinkViewModel(serviceCoordinator: ServiceCoordinator())
    
    var body: some View {
        ZStack {
            
            if viewModel.loading {
                ProgressView(AppContents.loadingText)
                    .tint(.orange)
                    .foregroundColor(.gray)
                    .accessibilityIdentifier(AccessibilityId.searchDrinkScreen_Progress)
            } else {
                VStack {
                    HStack {
                        Image(systemName: Images.searchDescriptionWarning)
                            .offset(y: -7)
                        Text(AppContents.searchScreenDescription)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                    }
                    .foregroundStyle(Color.red.opacity(0.8))
                    .padding()
                    
                    listView
                        .overlay {
                            if viewModel.drinkModelArray.isEmpty {
                                ContentUnavailableView.search
                                    .accessibilityIdentifier(AccessibilityId.searchDrinkScreen_ContentUnavailable)
                            }
                        }
                }
            }
        }
        .navigationTitle(homeScreenModel.title)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always) , prompt: AppContents.searchBarPlaceHolder)
        .onAppear {
            if !viewModel.searchText.isEmpty {
                viewModel.fetchDrinks()
            }
        }
        .onSubmit(of: .search) {
            if !viewModel.searchText.isEmpty {
                viewModel.fetchDrinks()
            }
        }
        .onChange(of: viewModel.searchText, { oldValue, newValue in
            
            viewModel.searchText = String(newValue.prefix(1))
            
            if viewModel.searchText != viewModel.newSearchedText {
                viewModel.newSearchedText = viewModel.searchText
                viewModel.fetchDrinks()
            }
        })
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
                            .accessibilityIdentifier(String(format: AccessibilityId.searchDrinkScreen_DrinkRow, String(index)))
                    }
                }
            }
            .accessibilityIdentifier(AccessibilityId.searchDrinkScreen_List)
            .padding(.all, 10)
        }
    }
}

#Preview {
    SearchDrinkView(homeScreenModel: HomeScreenModel(type: .alcoholic, image: Image(Images.alcoholic_Image), title: "Title", description: "Description"))
}
