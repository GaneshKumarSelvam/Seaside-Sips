//
//  DrinkDetailView.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import SwiftUI

struct DrinkDetailView: View {
    var drinkModel: DrinkModel
    @State var viewModel: DrinkDetailViewModel = DrinkDetailViewModel(serviceCoordinator: ServiceCoordinator())
    
    var body: some View {
        ZStack {
            if viewModel.loading {
                ProgressView(AppContents.loadingText)
                    .tint(.orange)
                    .foregroundColor(.gray)
                    .accessibilityIdentifier(AccessibilityId.detailsScreen_Progress)
            } else {
                detailsView
                    .accessibilityIdentifier(AccessibilityId.detailsScreen_ScrollView)
                    .overlay {
                        if viewModel.signleDrink.drinks?.count ?? 0 <= 0 {
                            ContentUnavailableView(
                                AppContents.noDataFoundText,
                                systemImage: Images.noDataFoundSystemImage,
                                description: Text(AppContents.noDataFound_Description))
                            .accessibilityIdentifier(AccessibilityId.detailsScreen_ContentUnavailable)
                        }
                    }
            }
        }
        .onAppear {
            viewModel.fetchDrinkById(id: drinkModel.id ?? AppContents.contentUnAvailable)
        }
        .navigationTitle(drinkModel.strDrink ?? AppContents.contentUnAvailable)
    }
    
    private var detailsView: some View {
        return ScrollView {
            if let imageURL = viewModel.drinkModel?.strDrinkThumb {
                VStack {
                    AsyncImage(url: URL(string: imageURL)) { phase in
                        if let image = phase.image {
                            image.resizable()
                        } else if phase.error != nil {
                            Image(Images.placeholder_Image)
                                .resizable()
                        } else {
                            ProgressView().progressViewStyle(.circular)
                        }
                    }
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 250)
                    .clipped()
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {

                if viewModel.shouldShowTitle {
                    Text(viewModel.getTitle!)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                    
                if viewModel.shouldShowInstructions {
                    Text(viewModel.getInstructions!)
                        .font(.body)
                        .foregroundStyle(.gray)
                }
                
                HStack(spacing: 10) {
                    if viewModel.shouldShowCategory1 {
                        Text(viewModel.getCategory1!)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .frame(height: 30)
                            .background(.brown)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                    if viewModel.shouldShowCategory2 {
                        Text(viewModel.getCategory2!)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .frame(height: 30)
                            .background(.brown)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
                
                
                HStack() {
                    Image(systemName: Images.ingredientsSystemImage)
                        .font(.title2)
                        .foregroundStyle(.cyan)
                    
                    
                    Text(AppContents.ingredientsText)
                        .font(.title2)
                        .foregroundStyle(.cyan)
                        .accessibilityIdentifier(AccessibilityId.detailsScreen_Ingredients)
                    Spacer()
                }
            }
            .padding()
            
            if viewModel.shouldShowIngredients {
                VStack(alignment: .center) {
                    ForEach(viewModel.getIngredientsArray ?? [], id: \.self) { ingredient in
                        
                        Text(ingredient)
                            .font(.subheadline)
                    }
                }
            }
            Spacer()
        }
        
    }
}

#Preview {
    DrinkDetailView(drinkModel: Utility.shared.getAlcoholicSingleJson())
}
