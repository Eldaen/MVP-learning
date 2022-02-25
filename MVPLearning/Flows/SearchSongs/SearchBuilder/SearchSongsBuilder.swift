//
//  SearchSongsBuilder.swift
//  MVPLearning
//
//  Created by Денис Сизов on 25.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SearchSongsBuilder {
	static func build() -> (UIViewController & SearchSongsViewInput) {
		let presenter = SearchSongsPresenter()
		let controller = SearchSongsController(presenter: presenter)
		
		presenter.controller = controller
		return controller
	}
}
