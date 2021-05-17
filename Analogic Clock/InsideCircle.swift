//
//  InsideCircle.swift
//  Analogic Clock
//
//  Created by Jorge Giannotta on 17/05/21.
//

import SwiftUI

struct InsideCircle: View {
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(.white)
                .frame(width: 25, height: 25)
            Circle()
                .foregroundColor(Color("intCircle"))
                .frame(width: 15, height: 15)
        }
    }
}

struct InsideCircle_Previews: PreviewProvider {
    static var previews: some View {
        InsideCircle()
    }
}
