class Presenter < User
  before_save do
    self.is_presenter = true
  end
end
