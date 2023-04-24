//
//  CertificatesView.swift
//  SwiftUICombineAndData
//
//  Created by Daniel Yeboah on 22.4.2023.
//

import SwiftUI

struct CertificatesView: View {
    @StateObject var certificateVM = CertificateViewModel() // initialise our class as a state so that the instance is preserved and it's updated anytime data in the view model is updated // this makes it a subscriber of the @Published variable of the viewModel
    @StateObject var networkReachability = NetworkReachability()
    @State private var selection: Int = 0 // it is read and writted to by SwiftUI and exists only when the view exists
    
    var body: some View {
        VStack {
            if networkReachability.reachable {
                if certificateVM.certificates.count > 0 {
                    TabView(selection: $selection) {
                        ForEach(certificateVM.certificates.indices, id: \.self) { index in
                            CertificateCard(selection: $selection)
                                .padding(.horizontal, 8)
                                .environmentObject(certificateVM)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                } else {
                    ProgressView()
                }
            } else {
                Text("Please connect to the Internet to see your certificates.")
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .background(AccountBackground())
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
