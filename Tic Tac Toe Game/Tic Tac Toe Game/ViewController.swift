//
//  ViewController.swift
//  Tic Tac Toe Game
//
//  Created by Maciek Girek on 6/7/17.
//  Copyright © 2017 Maciek Girek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var gameStateOn = true
  var player = 1 //Cross
  var board = [0,0,0,0,0,0,0,0,0]
  let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  var movesCounter = 0
  
  @IBOutlet weak var label: UILabel!
  
  @IBAction func button(_ sender: UIButton) {
    if(board[sender.tag - 1] == 0 && gameStateOn == true) {
      movesCounter += 1
      board[sender.tag - 1] = player
      if(player == 1) {
        sender.setImage(UIImage(named:"cross.jpeg"), for: UIControlState())
        
        player = 2
      }
      else {
        sender.setImage(UIImage(named:"nought.jpeg"), for: UIControlState())
        player = 1
      }
    }
    for i in winningCombinations {
      if(board[i[0]] != 0 && board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && gameStateOn == true) {
        gameStateOn = false
        if(player == 2) {
          label.text = "Cross has won !!"
          movesCounter = 0
          label.isHidden = false
          playAgainButton.isHidden = false
          
        }
        else {
          label.text = "Nought has won !!"
          movesCounter = 0
          label.isHidden = false
          playAgainButton.isHidden = false
          
        }
      }
    }
    gameStateOn = false
    for i in board {
      if(i == 0) {
        gameStateOn = true
        break
      }
    }
    print(movesCounter)
    if ( gameStateOn == false) {
      label.text = "IT IS A TIE"
      playAgainButton.isHidden = false
    }
  }
  
  @IBOutlet weak var playAgainButton: UIButton!
  
  @IBAction func playAgain(_ sender: UIButton) {
    gameStateOn = true
    movesCounter = 0
    board = [0,0,0,0,0,0,0,0,0]
    player = 1
    label.isHidden = true
    playAgainButton.isHidden = true
    
    for index in 1...9 {
      let button = view.viewWithTag(index) as! UIButton
      button.setImage(nil, for: UIControlState())
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

