//
//  HourStickView.swift
//  Analogic Clock
//
//  Created by Jorge Giannotta on 16/05/21.
//

import SwiftUI

struct HourStickView: View {
    var body: some View {
        VStack(alignment: .center, spacing: -2, content: {
            Capsule()
                .stroke(lineWidth: 7)
                .frame(width: 15, height: 30)
                .foregroundColor(.white)
            Rectangle()
                .fill()
                .frame(width: 9, height: 40)
                .foregroundColor(.white)
        })
    }
}

struct HourStickView_Previews: PreviewProvider {
    static var previews: some View {
        HourStickView()
    }
}
