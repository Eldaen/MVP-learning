//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp
	
    private lazy var headerViewController = AppDetailHeaderViewController(app: app)
	private lazy var whatsNewViewController = AppWhatsNewViewController(app: app)
    
    private let imageDownloader = ImageDownloader()
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        addHeaderViewController()
        addWhatsNewViewController() //ДЗ
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        self.view.addSubview(headerViewController.view)
        
        headerViewController.didMove(toParent: self)
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
    }
    
    private func addWhatsNewViewController() {
        //ДЗ: Добавить другие модели
        
        self.addChild(whatsNewViewController)
        self.view.addSubview(whatsNewViewController.view)
        
		whatsNewViewController.didMove(toParent: self)
		whatsNewViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
			whatsNewViewController.view.topAnchor.constraint(equalTo: headerViewController.view.bottomAnchor, constant: 16),
			whatsNewViewController.view.heightAnchor.constraint(equalToConstant: 200),
			whatsNewViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			whatsNewViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
}
