class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:concept].present? && params[:category_id].present?
      @expenses = Expense.where("concept like '%#{params[:concept]}%' AND category_id = '#{params[:category_id]}'")
    elsif params[:concept].present?
      @expenses = Expense.where("concept like '%#{params[:concept]}%'")
    elsif params[:category_id].present?
      @expenses = Expense.where("category_id = ?", params[:category_id])
    else
      @expenses = Expense.order("date DESC").where("user_id=?",current_user.id)
    end
  end
end
