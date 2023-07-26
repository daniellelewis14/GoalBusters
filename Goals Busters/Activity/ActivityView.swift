//
//  ActivityView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

struct ActivityView: View {
    @StateObject private var oo = ActivityOO()
    
    var body: some View {
        VStack {
            List(oo.data) { datum in
                Text(datum.name)
            }
        }
        .task {
            oo.fetch()
        }
    }
}

struct Activity_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
