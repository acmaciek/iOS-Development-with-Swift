//
//  ViewController.swift
//  personality quizz
//
//  Created by Maciek Girek on 6/19/17.
//  Copyright © 2017 Maciek Girek. All rights reserved.
//

import UIKit
    //Romantic , Adventurous, Enterpreneur, Creative
var questionList: [Question] = [Question(questionString: "What is your favorite cusine",answers:["Italian 🍕","Chinese 🍜","American 🍔","Mexican 🌮"],selectedAnswerIndex: nil),Question(questionString: "What is your favorite type of sport",answers:["Tennis 🎾","Extreme Sports 🏂","American Football 🏈","Soccer ⚽️"],selectedAnswerIndex: nil),Question(questionString: "What is your favorite car make",answers:["Ferrari 🏎","Jeep 🚙","Mercedes 🚕","Tesla 🚗"],selectedAnswerIndex: nil),Question(questionString: "What is your favorite movie",answers:["Titanic 🚢","Indiana Jones ⏳","Pursuit of Happiness 👨‍👦","Inception 😴"],selectedAnswerIndex: nil)]



class ViewController: UITableViewController {
  
  let Cell = "Cell"
  let Header = "Header"
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.tintColor = UIColor.yellow
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    tableView.register(AnswerClass.self, forCellReuseIdentifier: Cell)
    tableView.register(HeaderClass.self, forHeaderFooterViewReuseIdentifier: Header)
    navigationItem.title = "Question"
    tableView.sectionHeaderHeight = 50
    
    //Remove bottom lines from table view
    tableView.tableFooterView = UIView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return questionList.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Cell, for: indexPath) as! AnswerClass
    if let index = navigationController?.viewControllers.index(of: self) {
      let question = questionList[index]
      cell.nameLabel.text = question.answers?[indexPath.row]
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Header) as! HeaderClass
    if let index = navigationController?.viewControllers.index(of: self) {
      let question = questionList[index]
      header.nameLabel.text = question.questionString
    }
    return header
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let index = navigationController?.viewControllers.index(of: self) {
      questionList[index].selectedAnswerIndex = indexPath.item
      if index < questionList.count - 1 {
        let questionController = ViewController()
        navigationController?.pushViewController(questionController, animated: true)
      }else {
        let controller = ResultClass()
        navigationController?.pushViewController(controller, animated: true)
      }
    }
  }
  
}
class ResultClass: UIViewController {
  let resultLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.font = UIFont.systemFont(ofSize: 15)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    return label
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Restart", style: .plain, target: self, action: "done")
    navigationItem.title = "Results"
    view.backgroundColor = UIColor.white
    view.addSubview(resultLabel)
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":resultLabel]))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":resultLabel]))
    let names = ["Romantic ♥️","Adventurous 🗺","Enterpreneur 💵","Creative 👨‍🎨"]
    var score = 0
    for question in questionList {
      score = score + question.selectedAnswerIndex!
      //print(question.answers?[question.selectedAnswerIndex!])
    }
    let result = names[score % names.count]
    resultLabel.text = "Congratulations you are \(result)"
  }
  func done() {
    navigationController?.popToRootViewController(animated: true)}
}
class AnswerClass: UITableViewCell {
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Sample Answer"
    label.font = UIFont.systemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  func setupViews() {
    addSubview(nameLabel)
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    
  }
}

class HeaderClass: UITableViewHeaderFooterView {
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Sample Question"
    label.font = UIFont.systemFont(ofSize: 23)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  func setupViews() {
    addSubview(nameLabel)
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    
  }
  
}
