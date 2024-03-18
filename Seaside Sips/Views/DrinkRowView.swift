//
//  DrinkRowView.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import SwiftUI

struct DrinkRowView: View {
    var drinkModel: DrinkModel
    
    var body: some View {
        VStack {
            if let imageURL = drinkModel.strDrinkThumb {
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
                .frame(height: 200)
                .cornerRadius(10)
                .shadow(color: Color.primary.opacity(0.3), radius: 1)
            }
                                        
            Text(drinkModel.strDrink ?? AppContents.contentUnAvailable)
                .font(.callout)
                .foregroundStyle(.gray)
                .padding(EdgeInsets(top: 6, leading: 8, bottom: 2, trailing: 8))
        }
        .padding(.bottom, 10)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)

    }
}

#Preview {
    DrinkRowView(drinkModel: Utility.shared.getAlcoholicSingleJson())
}
