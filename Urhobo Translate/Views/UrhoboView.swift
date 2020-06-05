//
//  UrhoboView.swift
//  Urhobo Translate
//
//  Created by Ufuoma Okoro on 05/06/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Urhobo Views
import SwiftUI


struct Urhobo: View {
    
    var body: some View {
        
        
        VStack {
            
        Text("Place Holder")
        
        }
        
        
    }
    
    
    
}


//Urhobo Preview
struct Urhobo_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Urhobo()
        
    }
    
}



//Struct to text the data
struct TestJSON: View {
    
    //Get the JSON Data
    @ObservedObject var urhoboDictionary = DataLoader()
    
    
    
    
    var body: some View {
        
        
     
     
        VStack {
        
        //Text("Place Holder")
        
        //List {
            
            
            List(urhoboDictionary.dataStructure,id: \.id) { word in
                
                
                Text("\(word.english)")
                Text("\(word.urhobo)")
                Text("\(word.category)")
                
                
                
                
                
            }
            
    
            
            
            
            
        }//End of VStack
        
        
        
        
        
    }
    
}
