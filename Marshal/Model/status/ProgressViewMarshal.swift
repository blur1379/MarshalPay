//
//  ProgressViewMarshal.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct ProgressViewMarshal: View {
    var body: some View {
        VStack{
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
    }
}

struct ProgressViewTamuk_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewMarshal()
    }
}
