class PostsController < ApplicationController
  require 'securerandom'
  def show
    if Post.count > 4
      random = Random.new()
      id = [-1,-1,-1]
      i = 0
      while i < 4
        id[i] = random.rand(Post.first.id..Post.last.id)
        if Post.find_by(id:id[i]) == nil
          i -= 1
        else
          if i != 0
            for j in 0..(i-1) do
              if id[j] == id[i]
                i -= 1
              end
            end
          end
        end
        i += 1
      end
      @Posts = [Post.find_by(id:id[0]),Post.find_by(id:id[1]),Post.find_by(id:id[2]),Post.find_by(id:id[3])]

    else
      @Posts = Post.all
    end
      @Favs = Fav.all
    end
  def create
    @message = ""
  end
  def sendingmessage
    @post = Post.new(content:params[:content])
      while true
      @code = SecureRandom.hex(16)
        if Post.find_by(code:@code)
        else
          @post.code = @code
          break
        end
      end
    if @post.save
      @result = @post.code
      redirect_to("/posts/result/#{@result}")
    else
      @message = "メッセージが入力されていません"
      render('posts/create')
    end


  end
  def result
  end
  def fav
    @fav = Fav.new(post_id:params[:id])
    @fav.save
    redirect_to("/posts/show")
  end
  def search
    @message = "";
  end
  def find
    if @post = Post.find_by(code:params[:code])
      redirect_to("/posts/check/#{@post.id}")
    else
      @message = "合言葉に対応する投稿が見つかりませんでした。"
      render("posts/search")
    end

  end
  def check
    @Favs = Fav.all;
    @del = true;
    @delMessage = "削除";
  end
  def delete
    @Favs = Fav.all;

      Post.find_by(id:params[:id]).delete;
      @message = "削除しました"
      render("posts/search")

  end
  def top
  end

end
