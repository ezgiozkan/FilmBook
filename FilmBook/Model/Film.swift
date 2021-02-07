//
//  Film.swift
//  FilmBook
//
//  Created by ezgi on 5.02.2021.
//

import Foundation

//jsonformatter.com
//codable protokolü gelen veriyi işleyip değişkenlere atammaıza olanak sağlıyor
//decodable: gelen veriyi decode etmek için
//Encodable:: json yapısını veriye çevirmek için kullanılan protokol

struct Film: Codable {
    
    let title : String
    let year : String
    let imdbId : String
    let type: String
    let poster: String
    
    //Json apisinde değişken isimleri büyük harfle verilmiş. Codable yapmamıza rağmen bundan dolayı swift hangi değişkenin hangi veriye karşılık geldiğini tanımlayamaz. Bu sorunu çözebilmek için Coding Keys protokolünü kullanıyoruz.
    
    private enum CodingKeys: String, CodingKey
    {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}

struct ComingFilms:Codable  {
    
    let films : [Film]
    
   
}
