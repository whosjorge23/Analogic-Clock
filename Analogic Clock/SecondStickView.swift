//
//  SecondStickView.swift
//  Analogic Clock
//
//  Created by Jorge Giannotta on 17/05/21.
//

import SwiftUI

struct SecondStickView: View {
    var body: some View {
        VStack(alignment: .center, spacing: -2, content: {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill()
                .frame(width: 9, height: 120)
                .foregroundColor(.white)
        })
    }
}

struct SecondStickView_Previews: PreviewProvider {
    static var previews: some View {
        SecondStickView()
    }
}
