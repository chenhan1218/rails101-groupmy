class PostsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @post = @group.posts.build
  end

  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.new(params[:post])
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
  	@group = Group.find(params[:group_id])
  	@post = @group.posts.find(params[:id])
  end

  def update
  	@group = Group.find(params[:group_id])
  	@post = @group.posts.find(params[:id])

  	if @post.update_attributes(params[:post])
  	  redirect_to group_path(@group)
  	else
  	  render :edit
  	end
  end

  def destroy
  	@group = Group.find(params[:group_id])
  	@post = @group.posts.find(params[:id])

  	@post.destroy

  	redirect_to group_path(@group)
  end
end
