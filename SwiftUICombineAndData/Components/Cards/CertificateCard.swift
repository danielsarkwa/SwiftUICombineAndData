//
//  CertificateCard.swift
//  SwiftUICombineAndData
//
//  Created by Daniel Yeboah on 22.4.2023.
//

import SwiftUI

struct CertificateCard: View {
    var certificate: Certificate
    
    var body: some View {
        ZStack {
            Image("CertificateBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)

            content
        }
        .frame(maxWidth: 754, maxHeight: 465)
        .background(
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9921568627, green: 0.2470588235, blue: 0.2, alpha: 0.7949869118)).opacity(0.8), Color(#colorLiteral(red: 0.2980392157, green: 0, blue: 0.7843137255, alpha: 0.6)).opacity(0.2)]), center: .bottomTrailing, startRadius: 5, endRadius: 900)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30.0, style: .continuous)
                .stroke(Color.white)
                .blendMode(.overlay)
        )
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.1647058824, green: 0.1098039216, blue: 0.3568627451, alpha: 1)).opacity(0.5), radius: 30, x: 0, y: 15)
    }
    
    var content: some View {
        VStack(spacing: 20) {
            Image(certificate.logo)
                .resizable()
                .frame(width: 28, height: 28)
                .padding(8)
                .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                .mask(Circle())
                .background(Circle().stroke(Color.white.opacity(0.4), lineWidth: 0.5))
            
            Section {
                Text("Certificate of completion")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("this is to certify that")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7039374547)))
            }
            .textCase(.uppercase)
            
            Text("Stephanie")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("successfully completed the online course \(certificate.course) on \(certificate.date)")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7039374547)))
                .frame(maxWidth: 250)
                .fixedSize(horizontal: false, vertical: true)
            
            Section {
                Divider()
                instructorRow

                Divider()
                certificateDataRow
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7039374547)))
            .padding(.horizontal, 20)
        }
    }
    
    var instructorRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Design+Code Instructor:")
            Text(certificate.instructor)
        }
    }
    
    var certificateDataRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Certificate no: DC-\(certificate.id)")

            Text("Certificate url: designcode.io/certificate/\(certificate.id)")
        }
    }
}

struct CertificateCard_Previews: PreviewProvider {
    static var previews: some View {
        let certificate = Certificate(id: "123456", course: "SwiftUI, Combine and Data", date: "May 18th, 2021", logo: "Logo SwiftUI", instructor: "Stephanie Diep")
        
        CertificateCard(certificate: certificate)
    }
}
