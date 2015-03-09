# -*- coding: utf-8 -*-
source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Bootstrap3
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'

group :development, :test do
  gem 'spring'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rspec-rails'
  gem 'guard-rspec'                        # railsでguardを使うためのGem
  gem 'spring-commands-rspec' , '~> 1.0.2' # springでキャッシュした状態でguardを使うためのGem
  gem "factory_girl_rails" , "~> 4.4.1"    # テストデータの作成
end

group :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'shoulda-matchers', require: false # rspecで使うmatcher
  gem "faker" , "~> 1.4.3"              # 名前やメールアドレス、その他のプレースホルダをファクトリに提供します
  gem "database_cleaner" , "~> 1.3.0"   # まっさらな状態で各specが実行できるように、テストデータベースのデータを掃除します
#  gem "capybara" , "~> 2.4.3"           # ユーザとWebアプリケーションのやりとりをプログラム上で簡単にシミュレートできるようにします
#  gem "launchy" , "~> 2.4.2"            # 好きなタイミングでデフォルトのwebブラウザを開く
#  gem "selenium-webdriver" , "~> 2.43.0"# ブラウザ上でJavaScriptを利用する機能をCapybaraでテストできるようにします
end
