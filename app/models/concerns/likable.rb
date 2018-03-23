module Likable
  # def show_likes
  #   like.present? ? JSON.parse like : []
  # end

  def add_like(liker)
    like << liker.id
    like.uniq!
  end

  def unlike(liker)
    like.delete(liker.id)
  end

  def add_like!(liker)
    add_like(liker)
    save
  end

  def unlike!(liker)
    unlike(liker)
    save
  end

  def liked?(liker)
    like.include? liker.id
  end
end