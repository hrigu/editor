class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  # # GET /people/1
  # # GET /people/1.json
  # def show
  # end
  #


  def new
    @person = Person.find(params[:person_id])
    @comment = Comment.new
  end

  def edit
  end

  def create
    @person = Person.find(params[:person_id])
    @comment = Comment.new(comment_params)
    @comment.person = @person
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        # Da ein neuer Kommentar erstellt wurde...
        @person.update(updated_at: DateTime.now)
        format.html { redirect_to @person, notice: 'comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to([@person], notice: 'Comment was successfully updated.') }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  # # DELETE /people/1
  # # DELETE /people/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @person, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  #
  # # Use callbacks to share common setup or constraints between actions.
  def set_comment
     @person = Person.find(params[:person_id])
     @comment = Comment.find(params[:id])

  end
  #
  # # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :author)
  end

end
