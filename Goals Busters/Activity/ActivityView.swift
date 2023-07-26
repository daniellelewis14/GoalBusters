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
    
    var body: some View {
        VStack {
            List(oo.data) { datum in
                Text(datum.name)
            }
        }
        .task {
            oo.fetch()
        }
        .sheet(isPresented: $showAddView) {
            AddActivityView()
                .presentationDetents([.medium])
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    showAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
    }
}

struct Activity_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
