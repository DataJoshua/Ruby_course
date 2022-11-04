module ApplicationHelper
    def avatar_for(user)
        email_user = user.email
        hash = Digest::MD5.hexdigest(email_user)
        image_tag "https://www.gravatar.com/avatar/#{hash}"
    end

end