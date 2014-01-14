class PostsController < ApplicationController
  before_filter :find_group

  def new
    @post = @group.posts.build
  end

  def create
    @post = @group.posts.new(params[:post])
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
  	@post = @group.posts.find(params[:id])
  end

  def update
  	@post = @group.posts.find(params[:id])

  	if @post.update_attributes(params[:post])
  	  redirect_to group_path(@group)
  	else
  	  render :edit
  	end
  end

  def destroy
  	@post = @group.posts.find(params[:id])

  	@post.destroy

  	redirect_to group_path(@group)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end
