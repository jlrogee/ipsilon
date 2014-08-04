class KnowledgeBasesController < ApplicationController

  load_and_authorize_resource param_method: :knowledge_base_params

  before_action :find_by_id, only: [:destroy, :show, :update, :edit]

  def index
    if params[:name] == "instructions"
      @knowledge_bases = KnowledgeBase.instr.paginate(:page => params[:page])
      render 'instruction'
    else
      @knowledge_bases = KnowledgeBase.kb.paginate(:page => params[:page])
      render 'kb'
    end

  end

  def create
    @knowledge_base = KnowledgeBase.new(knowledge_base_params)
    @knowledge_base.create_user_id = current_user.id
    if @knowledge_base.save
      redirect_to (@knowledge_base.type.kb? ? kbase_path : inst_path)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @knowledge_base.update_user_id = current_user.id
    if @knowledge_base.update(knowledge_base_params)
      redirect_to (@knowledge_base.type.kb? ? kbase_path : inst_path)
    else
      render :edit
    end
  end

  def destroy
    @knowledge_base.destroy
    redirect_to kbase_path
  end

  def new
    @knowledge_base = KnowledgeBase.new
  end

  private

  def find_by_id
    @knowledge_base = KnowledgeBase.find(params[:id])
  end

  def knowledge_base_params
    params.require(:knowledge_base).permit(:type, :kbname, :instruction, :description, :search, :create_user_id, :update_user_id)
  end
end
