module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    image_tag('headshot.jpg', alt: user.name, class: 'gravatar')
  end
end
