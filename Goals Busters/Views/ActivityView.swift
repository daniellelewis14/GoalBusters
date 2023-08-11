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
            .navigationTitle("Goals Busters")
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
