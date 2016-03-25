class TodoItemsController < ApplicationController
    #finds the required todo_list for the todo_item
    before_action :set_todo_list

    def create
        #add a todo_item into a todo_list
        @todo_item = @todo_list.todo_items.create(todo_item_params)

        #go to todo_lists/show
        redirect_to todo_list_path(@todo_list)
    end

    def destroy
        # grab the todo_item
        @todo_item = @todo_list.todo_items.find(params[:id])
        #
        if @todo_item.destroy
            flash[:success] = "Todo List item was deleted."
        else
            flash[:error] = "Todo List item could not be deleted."
        end
        # route back to the todo_list
        redirect_to(@todo_list)
    end

    private
    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
    end

    def todo_item_params
        params[:todo_item].permit(:content)
    end
end
