//
//  SearchSongsBuilder.swift
//  MVPLearning
//
//  Created by Денис Сизов on 25.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Билдер структуры VIPER для экрана SearchSongs
final class SearchSongsBuilder {
	
	/// Собирает структуру и возвращает контроллер
	static func build() -> (UIViewController & SearchSongsViewInput) {
		let router = SearchSongsRouter()
		let interactor = SearchSongsInteractor()
		let presenter = SearchSongsPresenter(router: router, interactor: interactor)
		let controller = SearchSongsController(presenter: presenter)
		
		presenter.controller = controller
		router.controller = controller
		
		if #available(iOS 13.0, *) {
			let cache = ImageCacheService()
			interactor.cache = cache
		}
		
		return controller
	}
}
