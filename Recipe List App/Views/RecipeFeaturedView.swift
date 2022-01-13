//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Alcubierre Holdings Inc. on 2022-01-12.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    // Reference the view model
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        Text("Hello, Featured View!")
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
