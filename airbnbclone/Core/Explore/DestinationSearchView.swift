//
//  DestinationSearchView.swift
//  airbnbclone
//
//  Created by Zignuts Technolab on 19/03/24.
//

import SwiftUI

enum  DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show : Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .dates
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    var body: some View {
        VStack{
            HStack {
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
            }
                Spacer()
                
                if !destination.isEmpty {
                    Button("Clear"){
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack (alignment: .leading){
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search Destination", text: $destination)
                            .font(.subheadline)
                        
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color(.systemGray4))
                    }
                }else{
                    CollapsedPickerView(title: "where", description: "Add destination")
                    
                }
                
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location
                }
            }
            
            //date selection view
            VStack(alignment: .leading){
                if selectedOption == .dates{
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                        
                    }
                    .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }else{
                    CollapsedPickerView(title: "when", description:   "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .dates
                }
            }
            
            VStack(alignment: .leading){
                if selectedOption == .guests{
                    Text("who is coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper{
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests >= 0 else { return }
                        numGuests -= 1
                    }
                }else{
                    CollapsedPickerView( title: "who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .guests
                }
            }
            
             
            
            
            
            Spacer()
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
    }
}


struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }

    }
}
