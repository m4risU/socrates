class TestCyclesController < ApplicationController
  before_action :set_test_cycle, only: %i[ show edit update destroy ]

  # GET /test_cycles or /test_cycles.json
  def index
    @test_cycles = TestCycle.all
  end

  # GET /test_cycles/1 or /test_cycles/1.json
  def show
  end

  # GET /test_cycles/new
  def new
    @test_cycle = TestCycle.new
  end

  # GET /test_cycles/1/edit
  def edit
    @test_cycle.test_cycle_days.build
  end

  # POST /test_cycles or /test_cycles.json
  def create
    @test_cycle = TestCycle.new(test_cycle_params)

    respond_to do |format|
      if @test_cycle.save
        format.html { redirect_to test_cycle_url(@test_cycle), notice: "Test cycle was successfully created." }
        format.json { render :show, status: :created, location: @test_cycle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_cycles/1 or /test_cycles/1.json
  def update
    respond_to do |format|
      if @test_cycle.update(test_cycle_params)
        format.html { redirect_to test_cycle_url(@test_cycle), notice: "Test cycle was successfully updated." }
        format.json { render :show, status: :ok, location: @test_cycle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_cycles/1 or /test_cycles/1.json
  def destroy
    @test_cycle.destroy!

    respond_to do |format|
      format.html { redirect_to test_cycles_url, notice: "Test cycle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_cycle
      @test_cycle = TestCycle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_cycle_params
      params.require(:test_cycle).permit(:name, test_cycle_days_attributes: %i[id day_number mucus temp _destroy])
    end
end
