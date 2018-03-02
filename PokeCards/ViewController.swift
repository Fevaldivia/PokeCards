//
//  ViewController.swift
//  PokeCards
//
//  Created by Felipe Valdivia on 3/1/18.
//  Copyright © 2018 Felipe Valdivia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        let apiUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/")
        
        let request = URLRequest(url: apiUrl!)
        // Request to Pokemon API
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                print(data)
            }
        }
        
        task.resume()
    }
    

}

