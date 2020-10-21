class TasksController < ApplicationController 

    get '/tasks' do
      @tasks = task.all 
       erb :'tasks/index'
     end
  
    #CREATE
    get '/tasks/new' do 
        erb :"/tasks/new"
    end 
     
    post '/tasks' do 
      redirect_if_not_logged_in
  
      if params[:title] != ""
        @task= current_user.tasks.create(params)
        #@list = List.create(title: params[:title], user_id: current_user.id, description: params[:description], due_date: params[:due_date])
        flash[:message] = "You've created a task list successfully." if @task.id 
        redirect "/tasks/#{@task.id}"
      else 
        flash[:error]= "Please provide valid input."
        redirect '/tasks/new'
      end 
    end 
    
    #READ
    get '/tasks/:id' do 
      set_task 
      erb :'/tasks/show'
    end 
      
    get '/tasks/:id/edit' do
      set_task
      redirect_if_not_logged_in
      if authorized_to_edit?(@task)
        erb :'/tasks/edit'
      else 
         redirect "/users/#{current_user.id}"
      end 
    end
  
    #UPDATE
    patch '/tasks/:id' do
      redirect_if_not_logged_in
      set_task 
      if @task.user == current_user && params[:title] && params[:description] && params[:due_date] != ""
        @list.update(title: params[:title], description: params[:description], due_date: params[:due_date])
        flash[:message] = "You've updated the task successfully"
         redirect "/tasks/#{@task.id}" 
  
      else 
        flash[:error] ="Field cannot be empty. Please provide valid input"
        redirect "/tasks/#{@task.id}/edit"
     end  
    end
  
    #DELETE 
    delete '/tasks/:id' do 
      flash[:message] = "You've deleted the task successfully"
      set_task
      if authorized_to_edit?(@task) 
        @list.destroy
        redirect '/tasks'
      else 
        redirect '/tasks'
      end 
    end 
  
  
    private 
  
    def set_task 
      @task = task.find(params[:id])
    end 
    
  end 