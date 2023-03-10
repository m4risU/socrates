class Webhooks::WebhooksController < ::ApplicationController
  def create
    @webhook = Webhooks::Webhook.new(webhook_params)
    if @webhook.save
      render json: @webhook
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  def callback
    webhook = Webhooks::Webhook.find_by!(event: params[:event], secret: params[:secret])
    webhook.execute(callback_params)
    head :ok
  end

  private

  def callback_params
    params.require(:webhook_params).permit!.to_h.with_indifferent_access
  end

  def webhook_params
    params.require(:webhook).permit(:name, :url, :event)
  end
end