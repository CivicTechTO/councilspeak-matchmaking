class Presenter < User

  before_save do
    self.is_presenter = true
  end

  rails_admin do
    edit do
      exclude_fields :is_presenter
    end
  end

end
