module ApplicationHelper  
        def already_liked?(post)          
          post.likes.exists?(user_id: current_user.id) if(!current_user.nil?)
        end
end
