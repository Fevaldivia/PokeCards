//
//  GCDBlackBox.swift
//  PokeCards
//
//  Created by Felipe Valdivia on 3/11/18.
//  Copyright © 2018 Felipe Valdivia. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
