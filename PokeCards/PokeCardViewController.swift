//
//  PokeCardViewController.swift
//  PokeCards
//
//  Created by Felipe Valdivia on 3/1/18.
//  Copyright © 2018 Felipe Valdivia. All rights reserved.
//

import UIKit

class PokeCardViewController: UIViewController {

    @IBOutlet weak var pokemonName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func generatePokemon(_ sender: Any) {
        // TODO: Improve API request
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2/pokemon"
        
        let request = URLRequest(url: components.url!)
        // Request to Pokemon API
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("There is an Error: \(error)")
                return
            }
            
            // Optional binding to get data
            
            guard let data = data else {
                print("There is no data")
                return
            }
                    
            let parsedResult: [String:AnyObject]!
            
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
            } catch {
                print("Error in parse json")
                return
            }
            
            guard let resultDictonary = parsedResult["results"] as? [[String:AnyObject]] else {
                print("There is an error with result dictonary")
                return
            }
            
            let randomPokemon = Int(arc4random_uniform(UInt32(resultDictonary.count)))
            
            let pokemon = resultDictonary[randomPokemon] as [String: AnyObject]
            
            
            print(pokemon)

        }
        
        task.resume()
    }
    

}

