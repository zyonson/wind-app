class Admins::ToppagesController < Admins::ApplicationController
  def index
    @stores = Store.all
  end
end
