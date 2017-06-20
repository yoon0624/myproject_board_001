class Post < ActiveRecord::Base
    belongs_to :user
    has_many :replies
    validates :categoryname, presence: { message: "제목이 비었습니다."}
end
