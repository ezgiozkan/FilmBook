//
//  DownloaderClient.swift
//  FilmBook
//
//  Created by ezgi on 7.02.2021.
//

import Foundation

class DownloaderClient {
    
    func downloadFilms(search: String, completion: @escaping(Result<[Film]?, DownloaderError>) -> Void) {
        
        guard let url  = URL (string: "http://www.omdbapi.com/?i=tt3896198&apikey=171b169") else {
            
            return completion(.failure(.falseUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            guard let data = data, error == nil else {
                
                return completion(.failure(.falseValue))
            }
            
            guard let filmAnswer = try? JSONDecoder().decode(ComingFilms.self, from: data) else {
                
                return completion(.failure(.falseValueProcess))
            }
            
            completion(.success(filmAnswer.films))
            
        }.resume()
        
    }
    
    enum DownloaderError: Error {
        
        case falseUrl
        case falseValue
        case falseValueProcess
        
    }
    
}
