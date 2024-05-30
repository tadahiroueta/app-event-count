//
//  ViewController.swift
//  app-event-count
//
//  Created by Ueta, Lucas T on 3/4/24.
//

import UIKit

class ViewController: UIViewController {
    let applicationDidFinishLaunchingCountLabel = UILabel()
    let applicationWillConnectCountLabel = UILabel()
    let sceneWillConnectCountLabel = UILabel()
    let sceneDidBecomeActiveCountLabel = UILabel()
    let sceneWillResignCountLabel = UILabel()
    let sceneWillEnterForegroundCountLabel = UILabel()
    let sceneDidEnterBackgroundCountLabel = UILabel()
    
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    var applicationDidFinishLaunchingCount = 0 { didSet { applicationDidFinishLaunchingCountLabel.text = String(applicationDidFinishLaunchingCount) }}
    var applicationWillConnectCount = 0 { didSet { applicationWillConnectCountLabel.text = String(applicationWillConnectCount) }}
    var sceneWillConnectCount = 0 { didSet { sceneWillConnectCountLabel.text = String(sceneWillConnectCount) }}
    var sceneDidBecomeActiveCount = 0 { didSet { sceneDidBecomeActiveCountLabel.text = String(sceneDidBecomeActiveCount) }}
    var sceneWillResignCount = 0 { didSet { sceneWillResignCountLabel.text = String(sceneWillResignCount) }}
    var sceneWillEnterForegroundCount = 0 { didSet { sceneWillEnterForegroundCountLabel.text = String(sceneWillResignCount) }}
    var sceneDidEnterBackgroundCount = 0 { didSet { sceneDidEnterBackgroundCountLabel.text = String(sceneDidEnterBackgroundCount) }}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 75
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        for (text, countLabel) in zip([
            "application did finish launching",
            "application will connect",
            "scene will connect",
            "scene did become active",
            "scene will resign",
            "scene will enter foreground",
            "scene did enter background"
        ], [
            applicationDidFinishLaunchingCountLabel,
            applicationWillConnectCountLabel,
            sceneWillConnectCountLabel,
            sceneDidBecomeActiveCountLabel,
            sceneWillResignCountLabel,
            sceneWillEnterForegroundCountLabel,
            sceneDidEnterBackgroundCountLabel,
        ]) {
            addCount(text, with: countLabel, to: stack)
        }
        
        applicationDidFinishLaunchingCount = appDelegate.launchCount
    }

    func addCount(_ text: String, with countLabel: UILabel, to stack: UIStackView) {
        let countStack = UIStackView()
        countStack.spacing = 20
        stack.addArrangedSubview(countStack)
        
        countLabel.text = "0"
        countLabel.font = .boldSystemFont(ofSize: 22)
        countStack.addArrangedSubview(countLabel)
        
        let nameLabel = UILabel()
        nameLabel.text = text
        nameLabel.font = .systemFont(ofSize: 22)
        countStack.addArrangedSubview(nameLabel)
    }
}
