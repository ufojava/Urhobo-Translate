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
    
    
    public var id: Int
    
    public var english: String
    public var urhobo: String
    public var category: String
    
    
}




//Convert JSON File
public class DataLoader: ObservableObject {
    
    
    @Published var dataStructure = [UrhoboDataStructure]()
    
       @Published var id = 0
       @Published var english = ""
       @Published var urhobo = ""
       @Published var category = ""
    
    
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

