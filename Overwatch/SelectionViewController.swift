//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Lloyd W. Sykes on 1/29/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroScrollView: UIScrollView!
    
    var game: Game = Game()
    var heroType: HeroType! {
        didSet {
            game.heroType = heroType
            updateStackViewWithHeroes()
        }
    }
    
    override func viewDidLoad() {
        heroScrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        heroType = .offense
    }
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            heroType = .defense
        case 2:
            heroType = .tank
        case 3:
            heroType = .support
        default:
            heroType = .offense
        }
    }
    
    func updateStackViewWithHeroes() {
        
    }
}

extension SelectionViewController: UIScrollViewDelegate { }
