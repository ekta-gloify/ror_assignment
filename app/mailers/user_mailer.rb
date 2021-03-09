class UserMailer < ApplicationMailer

    def welcome_user(user,password)
        @user_name = user.a_name
        @user_password = password
        @user_email = user.email
        mail(to: user.email, subject: "Your account is created")
    end

    def assigned(book,library)
        @user = book.user
        @book = book
        @library = library
        mail(to: @user.email, subject: "Your book is assigned")
    end

    def unassigned(book,library)
        @user = book.user
        @book = book
        @library = library
        mail(to: @user.email, subject: "Your book is unassigned")
    end
end
