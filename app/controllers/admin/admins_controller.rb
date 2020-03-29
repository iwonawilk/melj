class Admin::AdminsController < ApplicationController
  def index
    http_basic_authenticate_with name: 'melj', password: 'melj'
  end
end
