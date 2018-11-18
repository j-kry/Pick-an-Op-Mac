//
//  ViewController.swift
//  Pick an Op Mac
//
//  Created by Justin Krysinski on 5/31/18.
//  Copyright © 2018 Justin Krysinski. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var attackerImg: NSImageView!
    @IBOutlet weak var defenderImg: NSImageView!
    @IBOutlet weak var attackerLbl: NSTextField!
    @IBOutlet weak var defenderLbl: NSTextField!
    
    @IBOutlet weak var atkTeam1: NSImageView!
    @IBOutlet weak var atkTeam2: NSImageView!
    @IBOutlet weak var atkTeam3: NSImageView!
    @IBOutlet weak var atkTeam4: NSImageView!
    @IBOutlet weak var atkTeam5: NSImageView!
    
    @IBOutlet weak var dfTeam1: NSImageView!
    @IBOutlet weak var dfTeam2: NSImageView!
    @IBOutlet weak var dfTeam3: NSImageView!
    @IBOutlet weak var dfTeam4: NSImageView!
    @IBOutlet weak var dfTeam5: NSImageView!
    
    
    var attackers: [NSImage] = []
    var defenders: [NSImage] = []
    var exclude: [Int] = []
    var attackerNum = 0
    var defenderNum = 0
    var attackerNames = ["Sledge", "Thatcher", "Ash", "Thermite", "Twitch", "Montagne", "Glaz", "Fuze", "Blitz", "IQ", "Buck", "Blackbeard", "Capitao", "Hibana", "Jackal", "Ying", "Zofia", "Dokkaebi", "Lion", "Finka", "Maverick"]
    var defenderNames = ["Smoke", "Mute", "Castle", "Pulse", "Doc", "Rook", "Kapkan", "Tachanka", "Jager", "Bandit", "Frost", "Valkyrie", "Caveira", "Echo", "Mira", "Lesion", "Ela", "Vigil", "Maestro", "Alibi", "Clash"]
    var atkTeam: [NSImage] = []
    var dfTeam: [NSImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...20{
            //swift 3
            //attackers.append(NSImage(named: "\(index)")!)
            
            attackers.append(NSImage.init(named: "\(index)")!)
        }

        for index in 0...20 {
            //swift 3
            //defenders.append(NSImage(named: "\(index)-df")!)
            
            defenders.append(NSImage.init(named: "\(index)-df")!)
        }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func attackBtn(_ sender: NSButton) {
        
        attackerNum = Int(arc4random_uniform(21))
        attackerImg.image = attackers[attackerNum]
        attackerLbl.stringValue = attackerNames[attackerNum]
        attackerLbl.isHidden = false
        
    }
    
    @IBAction func defendBtn(_ sender: NSButton) {
        
        defenderNum = Int(arc4random_uniform(21))
        defenderImg.image = defenders[defenderNum]
        defenderLbl.stringValue = defenderNames[defenderNum]
        defenderLbl.isHidden = false
        
    }
    
    @IBAction func attackTeamBtn(_ sender: NSButton) {
        
        for _ in 0...4 {
            attackerNum = Int(arc4random_uniform(21))
            while(exclude.contains(attackerNum)) {
                attackerNum = Int(arc4random_uniform(21))
            }
            atkTeam.append(attackers[attackerNum])
            exclude.append(attackerNum)
        }
        atkTeam1.image = atkTeam[0]
        atkTeam2.image = atkTeam[1]
        atkTeam3.image = atkTeam[2]
        atkTeam4.image = atkTeam[3]
        atkTeam5.image = atkTeam[4]
        exclude.removeAll()
        atkTeam.removeAll()
        
    }
    
    @IBAction func defendTeamBtn(_ sender: NSButton) {
        
        for _ in 0...4 {
            defenderNum = Int(arc4random_uniform(21))
            while(exclude.contains(defenderNum)) {
                defenderNum = Int(arc4random_uniform(21))
            }
            dfTeam.append(defenders[defenderNum])
            exclude.append(defenderNum)
        }
        dfTeam1.image = dfTeam[0]
        dfTeam2.image = dfTeam[1]
        dfTeam3.image = dfTeam[2]
        dfTeam4.image = dfTeam[3]
        dfTeam5.image = dfTeam[4]
        exclude.removeAll()
        dfTeam.removeAll()
        
    }
    
    
}

