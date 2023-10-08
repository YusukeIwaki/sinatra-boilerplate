# frozen_string_literal: true

require 'bundler'
Bundler.require :default, (ENV['RACK_ENV'] || :development).to_sym

require_relative './config/activerecord'
require_relative './config/zeitwerk'
require 'sinatra/base'

class Application < Sinatra::Base
  use ApplicationLogger
  helpers ApplicationLogger::Helper
  set :show_exceptions, false

  PAGES = [
    ['顧客情報取得', 'util/customer_info.html'],
  ]
  get '/' do
    @title = 'TOP'
    erb :"index.html", locals: { pages: PAGES }
  end
  PAGES.each do |title, path|
    get "/#{path}" do
      @title = title
      erb path.to_sym
    end
  end
end
