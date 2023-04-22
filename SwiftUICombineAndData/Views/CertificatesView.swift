//
//  CertificatesView.swift
//  SwiftUICombineAndData
//
//  Created by Daniel Yeboah on 22.4.2023.
//

import SwiftUI

struct CertificatesView: View {
    @StateObject var certificateVM = CertificateViewModel() // initialise our class as a state so that the instance is preserved and it's updated anytime data in the view model is updated // this makes it a subscriber of the @Published variable of the viewModel
    
    var body: some View {
        VStack {
            ForEach(certificateVM.certificates, id: \.id) { certificate in
                CertificateCard(certificate: certificate)
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
