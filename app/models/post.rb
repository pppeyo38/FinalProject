class Post < ApplicationRecord

	# バリデーション
	# 空白の投稿と、140字以上の投稿を防ぐ
	validates :content, {presence: true, length: {maximum: 140}}
	validates :user_id, {presence: true}

	def user
		return User.find_by(id: self.user_id)
	end

end
