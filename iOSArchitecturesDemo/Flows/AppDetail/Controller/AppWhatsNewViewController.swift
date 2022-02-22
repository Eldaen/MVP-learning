//
//  AppWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Сизов on 22.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Контроллер для отображения данных об изменениях в новой версии
final class AppWhatsNewViewController: UIViewController {
	
	/// Модель приложения
	private let app: ITunesApp
	
	/// Кастомная вью
	private var appDetailHeaderView: AppDetailHeaderView {
		return self.view as! AppDetailHeaderView
	}
	
	init(app: ITunesApp) {
		self.app = app
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = AppDetailHeaderView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fillData()
	}
}
