class StaticPagesController < ApplicationController
  def home
   if admin_signed_in?
        redirect_to '/admin'
       end
    end

    def help
    end

    def contact
    end
end
