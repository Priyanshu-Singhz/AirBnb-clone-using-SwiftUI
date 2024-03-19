//
//  ListingView.swift
//  airbnbclone
//
//  Created by Zignuts Technolab on 19/03/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    var body: some View {
        VStack(spacing: 8){
            // images
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            //listing details
            HStack(alignment: .top){
                //details
                VStack(alignment: .leading){
                    Text("Gujarat, India")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)

                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing : 4){
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                            
                    }
                    .foregroundStyle(.black)
                    
                }
                
                Spacer()
                
                //ratings
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
                .foregroundStyle(.black)
                
                
                
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}
