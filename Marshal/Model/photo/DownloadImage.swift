//
//  DownloadImage.swift
//  Marshal
//
//  Created by Blur on 2/9/22.
//

import SwiftUI
import URLImage
struct DownloadImage: View {
    @Binding var imageName : String
    
    var body: some View {
        URLImage(ConstantData().stringToURLForImage(url: imageName)) {
            // This view is displayed before download starts
            EmptyView()
        } inProgress: { progress in
            // Display progress
            ProgressViewMarshal()
        } failure: { error, retry in
            // Display error and retry button
            VStack {
//                Text(error.localizedDescription)
                Button("تلاش مجدد", action: retry)
            }
        } content: { image in
            // Downloaded image
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct DownloadImage_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImage(imageName: .constant(""))
    }
}
