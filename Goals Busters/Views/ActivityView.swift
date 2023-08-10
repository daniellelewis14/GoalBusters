//
//  ActivityView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var oo: ActivityOO
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    HStack {
                        Text("GOals Busters")
                            .font(Font.custom("ghostbusters", size: 40))
                        Spacer()
                    }
                    LazyVStack {
                        ForEach($oo.data) { $item in
                            NavigationLink(destination: DetailedActivityView(activity: $item, oo: oo)) {
                                ListRowView(activity: $item)
                            }
                        }
                        
                    }
                    
                    Spacer()
                }
            }
            .sheet(isPresented: $showAddView) {
                AddActivityView(oo: oo)
                    .presentationBackground(.ultraThinMaterial)
                    .presentationCornerRadius(15)
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
}

struct Activity_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(oo: ActivityOO())
    }
}
