class WebhooksController < ApplicationController
  before_action :set_webhook, only: %i[ show edit update destroy ]

  skip_before_action :verify_authenticity_token, only: [:callback]
  before_action :authenticate_user!, except: [:callback]

  # GET /webhooks or /webhooks.json
  def index
    @webhooks = Webhook.all
  end

  # GET /webhooks/1 or /webhooks/1.json
  def show
  end

  # GET /webhooks/new
  def new
    @webhook = Webhook.new
  end

  # GET /webhooks/1/edit
  def edit
  end

  # POST /webhooks or /webhooks.json
  def create
    @webhook = Webhook.new(webhook_params)

    respond_to do |format|
      if @webhook.save
        format.html { redirect_to webhook_url(@webhook), notice: "Webhook was successfully created." }
        format.json { render :show, status: :created, location: @webhook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @webhook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webhooks/1 or /webhooks/1.json
  def update
    respond_to do |format|
      if @webhook.update(webhook_params)
        format.html { redirect_to webhook_url(@webhook), notice: "Webhook was successfully updated." }
        format.json { render :show, status: :ok, location: @webhook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @webhook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webhooks/1 or /webhooks/1.json
  def destroy
    @webhook.destroy

    respond_to do |format|
      format.html { redirect_to webhooks_url, notice: "Webhook was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def callback
    webhook = Webhook.find_by!(event: params[:event], secret: params[:secret])
    webhook.execute(callback_params)
    render json: { status: :ok }
  end

  private

    def callback_params
      params.require(:webhook_params).permit!.to_h.with_indifferent_access
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_webhook
      @webhook = Webhook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webhook_params
      params.require(:webhook).permit(:url, :name, :event)
    end
end
