//
//  SearchSongsRouter.swift
//  MVPLearning
//
//  Created by Денис Сизов on 26.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Протокол роутера для экрана поиска песен
protocol SearchSongsRouterInput {
	
	/// Открывает экран проигрывания песни
	func openSong(_ song: ITunesSong)
}

/// Роутер для экрана поиска песен
final class SearchSongsRouter: SearchSongsRouterInput {
	
	/// Контроллер, на котором будет осуществляться переход
	weak var controller: UIViewController?
	
	func openSong(_ song: ITunesSong) {
		let vc = UIViewController()
		controller?.navigationController?.pushViewController(vc, animated: true)
	}
}
