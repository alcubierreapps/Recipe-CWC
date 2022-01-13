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
       
        VStack(alignment: .leading) {
            Spacer()
            Text("Features Recipes")
                .bold()
                .padding()
                .font(.largeTitle)
           
        GeometryReader { geo in
         
            TabView {
                
                //Loop through each recipe
                ForEach (0..<model.recipes.count) { index in
                    
                    //Only show tthose that should be feattures
                    if model.recipes[index].featured == true {
                        
                        //Recipe Card
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                            
                            VStack(spacing: 0){
                                Image(model.recipes[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped(antialiased: true)
                                Text(model.recipes[index].name)
                                    .padding(5)
                            }
                            
                        }
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
        
            VStack(alignment: .leading, spacing: 10){
                
                Text("Preparation Time")
                    .font(.headline)
                Text("1 Hour")
                
                Text("Highlights")
                    .font(.headline)
                Text("Halthy, Hearty")
            }
            .padding()
        
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
