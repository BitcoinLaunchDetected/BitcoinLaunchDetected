class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy, :proceed, :status]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.sender = current_user

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def affirm
    user = User.find(params[:id])
    user.affirm if user

    render nothing: true
  end

  def proceed
    satoshi_amount = @transaction.amount * 100000000

    request_url = "https://blockchain.info/merchant/#{@transaction.sender.guid}/payment"
    request_url += "?password=#{params["main_password"]}"
    if params[:second_password].present?
      request_url += "&second_password=#{params[:second_password]}"
    end
    request_url += "&to=#{@transaction.recipient.address}"
    request_url += "&amount=#{satoshi_amount}"

    resp = HTTParty.get(request_url)
    logger.debug resp.code
    logger.debug resp.body

    @transaction.update(finished: true)

    redirect_to action: "show"
  end

  def status
    render json: {affirmed: @transaction.affirmed?}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:recipient_id, :amount)
    end
end
