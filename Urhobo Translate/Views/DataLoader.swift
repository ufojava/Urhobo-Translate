//
//  DataLoader.swift
//  Urhobo Translate
//
//  Created by Ufuoma Okoro on 04/06/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//
//File to decode JSON File
import SwiftUI


struct UrhoboDataStructure: Codable {
    
    
    var id: Int
    
    var english: String
    var urhobo: String
    var category: String
    
    
}



//Class to define the structure
class InitUrhoboDataStructure: ObservableObject {
    
    @Published var english = ""
    @Published var urhobo = ""
    @Published var category = ""
    
    
}


//Convert JSON File
public class DataLoader: ObservableObject {
    
    
    @Published var dataStructure = [UrhoboDataStructure]()
    
    
    init() {
        //Initialize JSON Function
        decodeJSONFIle()
    }
    
    
    
    
    
    
    //Function to decode JSON FIle
    func decodeJSONFIle() {
        
        //File Location
        if let fileLocation = Bundle.main.url(forResource: "UrhoboDictionay", withExtension: "json") {
            
            
            //Do try catch
            
            do {
                
                
                let data = try Data(contentsOf: fileLocation)
                
                
            //Define Decoder
                
                let jsonDecoder = JSONDecoder()
                
                
            //Decode JSON File
                let dataFromJSON = try jsonDecoder.decode([UrhoboDataStructure].self, from: data)
                
                
                //Async for Data load
                DispatchQueue.main.async {
                    self.dataStructure = dataFromJSON
                }
                
                
                
                
            } catch {
                
                
                print("File not found")
                
                
                
            }//End of catch
            
            
                        
            
            
        }//End of if let
        
        
        
        
        
    }//End of function
    
    
    
    
        
    
}//End of Class

