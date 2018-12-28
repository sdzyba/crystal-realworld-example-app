class Users::ShowSerializer
  private getter user : User

  def initialize(@user : User)
  end

  def render
    {
      user: {
        username: user.username,
        email:    user.email,
        bio:      user.bio_column.value(""),
        image:    user.image_column.value(""),
        token:    user.generate_token,
      },
    }.to_json
  end
end
