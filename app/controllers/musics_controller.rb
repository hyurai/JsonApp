require 'open-uri'
require 'net/http'
require 'json'

class MusicsController < ApplicationController
   
    def index
        @musics = Music.all
    end
    
    def new
        keyword = params[:keyword]
        uri = URI("https://itunes.apple.com/search")
        uri.query = URI.encode_www_form({term: keyword,country: "US",media: "music",limit: 1})
        res = Net::HTTP.get_response(uri)
        returned_JSON = JSON.parse(res.body)
        @musics = returned_JSON["results"]
    end
    
    def create
        music = Music.create(title: params[:title],name: params[:name],img: params[:img])
        redirect_to '/'
    end
end
