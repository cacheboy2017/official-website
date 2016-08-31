class Admin::FaqsController < AdminController
  before_action :set_faq, only: %i(show edit update destroy)

  # GET /faqs
  # GET /faqs.json
  def index
    @faqs = Faq.all
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
  end

  # GET /faqs/new
  def new
    @faq = Faq.new
  end

  # GET /faqs/1/edit
  def edit
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(faq_params)

    if @faq.save

      redirect_to admin_faqs_path
    else
      render :new
    end
  end

  def update
    if @faq.update(faq_params)

      redirect_to admin_faqs_path
    else
      render :edit
    end
  end

  def destroy
    @faq.destroy
    redirect_to admin_faqs_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_params
    params.require(:faq).permit(:title, :content, :category_id, :is_hidden, :is_display)
  end
end
