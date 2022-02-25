//
//  SearchSongsPresenter.swift
//  MVPLearning
//
//  Created by Денис Сизов on 25.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Протокол для вызова контроллера SearchSongs из презентера
protocol SearchSongsViewOutput: AnyObject {
	
}

/// Протокол для вызова презентера из контроллера SearchSongs
protocol SearchSongsViewInput: AnyObject {
	
}

/// Презентер поиска песен
final class SearchSongsPresenter {
	
	/// Контроллер поиска песен
	weak var controller: (UIViewController & SearchSongsViewInput)?
	
}

// MARK: - SearchSongsViewInput

extension SearchSongsPresenter: SearchSongsViewOutput {
	
}


