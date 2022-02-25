//
//  SearchSongsController.swift
//  MVPLearning
//
//  Created by Денис Сизов on 25.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Контроллер поиска песен
final class SearchSongsController: UIViewController {
	
	/// Презентер поиска песен
	private let searchSongsPresenter: SearchSongsViewOutput
	
	// MARK: - Init
	
	init(presenter: SearchSongsViewOutput) {
		self.searchSongsPresenter = presenter
		super.init()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

// MARK: - SearchViewOutput

extension SearchSongsController: SearchSongsViewInput {
	
}
