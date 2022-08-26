//
//  ViewController.swift
//  FooBar
//
//  Created by Ava Parks on 8/26/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    var currNumber = 2;
    var player = AVAudioPlayer()
    
    enum FooBarEnum {
        case Foo
        case Bar
        case FooBar
        case None
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func numPressed(_ sender: Any) {
        
        // when button pressed
        
        let isEnum = isFooBar(num:currNumber);
        
        // display stuff
        
        switch isEnum {
        case .Foo:
            numberLabel.text = "Foo"
            
            let url = Bundle.main.url(forResource: "Foo", withExtension: "m4a")
             player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            self.view.backgroundColor = UIColor.green
        case .Bar:
            numberLabel.text = "Bar"
            let url = Bundle.main.url(forResource: "Bar", withExtension: "m4a")
             player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            self.view.backgroundColor = UIColor.yellow
        case .FooBar:
            numberLabel.text = "FooBar"
            let url = Bundle.main.url(forResource: "FooBar", withExtension: "m4a")
             player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            self.view.backgroundColor = UIColor.red
        case .None:
            numberLabel.text = "\(currNumber)"
            self.view.backgroundColor = UIColor.black
        }
        
        currNumber+=1;
    }
    
    func isFooBar(num:Int) -> FooBarEnum {
        
        // checks if its a foobar
        
        if ((num % 3) == 0 && (num % 5) == 0){
            return FooBarEnum.FooBar;
        }
        else if ((num % 3) == 0) {
            return FooBarEnum.Foo;
        }
        else if ((num % 5) == 0) {
            return FooBarEnum.Bar;
        }
        
        return FooBarEnum.None;
    }

}

