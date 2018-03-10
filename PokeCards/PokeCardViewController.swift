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
        let apiUrl = URL(string: "https://pokeapi.co/api/v2/pokemon")
        
        let request = URLRequest(url: apiUrl!)
        // Request to Pokemon API
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                // Optional binding to get data
                if let data = data {
                    let parsedResult: [String:AnyObject]!
                    do {
                        parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
                        
                        if let resultDictonary = parsedResult["results"] as? [[String:AnyObject]]  {
                            print(resultDictonary[0])
                        }
                        
                    } catch {
                        print("Error in parse json")
                    }
                }
            }
        }
        
        task.resume()
    }
    

}

