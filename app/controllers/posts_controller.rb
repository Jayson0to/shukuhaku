class PostsController < ApplicationController
  def index
    @posts = Room.all
    
end
  
  def search
    @rooms = Room.all
    def @rooms.search(search) #self.はUser.を意味
      if search
        Room.where(['name LIKE ?', " %#{params [:search]}%"]) #検索とuseanameの部分一致を表示。
      else
        Room.all
     end
    end
end
end
