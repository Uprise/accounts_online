class PagesController < ApplicationController
  def home
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "home"
      end
    end
  end

end
