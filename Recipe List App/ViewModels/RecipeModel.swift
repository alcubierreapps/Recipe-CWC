//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //Get single serving size by multipling denomminatior by the recipe servings
            denominator *= recipeServings
            
            //Get target portion by multiplying numerator by targer servigs
            numerator *= targetServings
            
            //Reduce fraction by greatest comon divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get the whole portion if numerator > denominator
            
            if numerator >= denominator {
                
                //Calculate whole portions
                wholePortions = numerator / denominator
                
                //Calculate the reminder
                numerator = numerator % denominator
                
                //Assign to portion string
                portion += String(wholePortions)
            }
            
            //Express the remainder as a fraction
            if numerator > 0 {
                
                //Assign reminder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        
        // Else/return of the highest if statement
        
        if var unit = ingredient.unit {
            
            // If we need to make plurals of the suffix
            if wholePortions > 1 {
                
                //Calcullate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
                
            }
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
    }
}
