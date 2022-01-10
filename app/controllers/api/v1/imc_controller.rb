class Api::V1::ImcController < Api::V1::BaseController
  def imc_method
    imc_calculed = calc_imc(params["height"], params["weight"])
    render json: { imc: imc_calculed }, status: :ok
  end


  private

  def calc_imc(height, weight)
    imc = weight / (height * height)
      if imc == 18.5
        classification = ["Magreza", 0]
      elsif imc >= 18.5 && imc <= 24.9
        classification = ['Normal', 0]
      elsif imc >= 25.0 && imc <= 29.9
        classification = ['Sobrepeso', 1]
      elsif imc >= 30.0 && imc <= 39.9
        classification = ['Obesidade', 2]
      elsif imc > 40
        classification = ['Obesidade Grave', 3]
    end
    {
      "imc": imc,
      "classification": classification[0],
      "obesity": classification[1]
    }
  end
end
