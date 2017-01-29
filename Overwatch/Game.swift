//
//  Game.swift
//  Overwatch
//
//  Created by Lloyd W. Sykes on 1/28/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation

struct Game {
    var offenseCharacters = [Hero]()
    var defenseCharacters = [Hero]()
    var supportCharacters = [Hero]()
    var tankCharacters = [Hero]()
    var heroType: HeroType = .offense
    var heroes: [Hero] { return heroesForType() }
    init () {
        createAllHeros()
    }
}

extension Game {
    mutating func createAllHeros() {
        let offenseHeroNames = HeroName.heroes(with: .offense)
        let defenseHeroNames = HeroName.heroes(with: .defense)
        let supportHeroNames = HeroName.heroes(with: .support)
        let tankHeroNames = HeroName.heroes(with: .tank)
        
        offenseHeroNames.map { (offenseHeroName) in
            let offenseHero = Hero(name: offenseHeroName)
            offenseCharacters.append(offenseHero)
        }
        
        defenseHeroNames.map { (defenseHeroName) in
            let defenseHero = Hero(name: defenseHeroName)
            defenseCharacters.append(defenseHero)
        }
        
        supportHeroNames.map { (supportHeroName) in
            let supportHero = Hero(name: supportHeroName)
            supportCharacters.append(supportHero)
        }
        
        tankHeroNames.map { (tankHeroName) in
            let tankHero = Hero(name: tankHeroName)
            tankCharacters.append(tankHero)
        }
        
    }
    
    func heroesForType() -> [Hero] {
        switch heroType {
        case .offense:
            return offenseCharacters
        case .defense:
            return defenseCharacters
        case .support:
            return supportCharacters
        case .tank:
            return tankCharacters
        }
    }
}
