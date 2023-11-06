class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @photo, notice: 'Comentario creado exitosamente.'
    else
      redirect_to @photo, alert: 'Error al crear el comentario.'
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    return if can_edit_comment?(@comment)

    redirect_to root_path, alert: 'No tienes permiso para editar este comentario.'
  end

  def update
    @comment = Comment.find(params[:id])

    unless can_edit_comment?(@comment)
      redirect_to root_path, alert: 'No tienes permiso para editar este comentario.'
      return
    end

    if @comment.update(comment_params)
      redirect_to @photo, notice: 'Comentario actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    unless can_edit_comment?(@comment)
      redirect_to root_path, alert: 'No tienes permiso para borrar este comentario.'
      return
    end

    @comment.destroy
    redirect_to @comment.photo, notice: 'Comentario eliminado exitosamente.'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def can_edit_comment?(comment)
    # Verificar si el usuario actual es el autor del comentario o un administrador
    current_user == comment.user || current_user.admin?
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end
end
