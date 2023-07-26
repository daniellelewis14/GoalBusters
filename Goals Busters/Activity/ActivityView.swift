//
//  ActivityView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

import SwiftUI

struct ActivityView: View {
    @StateObject private var oo = ActivityOO()
    @State private var showAddView = false
    
    func removeItems(at offsets: IndexSet) {
        oo.data.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($oo.data) { $item in
                        NavigationLink(destination: DetailedActivityView(activity: $item)) {
                            Text(item.name)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .sheet(isPresented: $showAddView) {
                AddActivityView(oo: oo)
                    .presentationDetents([.medium])
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
            .navigationTitle("Goals")
        }
    }
}

struct Activity_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
