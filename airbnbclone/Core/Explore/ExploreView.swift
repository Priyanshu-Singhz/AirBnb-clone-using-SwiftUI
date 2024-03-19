//
//  ExploreView.swift
//  airbnbclone
//
//  Created by Zignuts Technolab on 19/03/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                SearchAndFilterBar()
                LazyVStack(spacing: 32) {
                    ForEach(0 ... 10, id: \.self) { _ in
                        ListingItemView()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
         
        }
    }
}


#Preview {
    ExploreView()
}
