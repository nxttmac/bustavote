module ApplicationHelper
<<<<<<< HEAD
end
=======

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Bustavote"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
>>>>>>> 8d71f9753e931c4ca8b1bd4d898d618e4472bab0
