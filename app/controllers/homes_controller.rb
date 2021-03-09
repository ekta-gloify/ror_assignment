class HomesController < ApplicationController
    def index
        if signed_in?
            if current_user.role == 'admin'
                redirect_to admin_page_path
            else
                redirect_to author_page_path
            end
        end
    end 
    
    def author_page
        if current_user&.role
            unless current_user.role == 'author'
                redirect_to admin_page_path
            end
            @books = current_user.books
        else
            redirect_to root_path
        end
    end

    def admin_page
        if current_user&.role
            unless current_user.role == 'admin'
                redirect_to author_page_path
            end
        else
            redirect_to root_path
        end
    end
end

