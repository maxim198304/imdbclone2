class Movie < ApplicationRecord
  enum category: { drama: 0, fantazy: 1, horror: 2, comedy: 3 }
end
