class PublicController < ApplicationController
  
  def new_user
    @user = User.new    
  end
  
  def create_user
    @user = User.new(params[:user])
    null = ""
    if @user.username == null || @user.password == null
      flash[:notice] = "New user creation failed! You probably didn't fill everything in, dunderhead."
      redirect_to(:action => 'new_user')
    elsif @user.save
      flash[:notice] = "Congratulations. You're our newest user perhaps!"
      redirect_to(:action => "index")
    else 
      flash[:notice] = "Fail!!!! I dunno why. Try again maybe?"
      render(:action => "new_user")
    end
  end
  
  def login
    @users = User.new
  end
  
 def send_login
    @user = User.new(params[:user])
    
    logged_in_user = @user.try_to_login
  if logged_in_user
    session[:user_id] = logged_in_user.id
    session[:user_name] = logged_in_user.username
    flash[:notice] = 'you are now logged in bro!'
    redirect_to(:action => "turn_brown")
  else 
    flash[:notice] = 'not logged in. username or password incorrect'
    render(:controller => 'public', :action => 'login')
  end 
 end
  
  def logout 
    session[:user_id] = nil 
    session[:user_name] = nil
    flash[:notice] = "ya got yourself logged out, fool!"
    redirect_to(:action => 'index')
  end
  
  def new_tracker
    if session[:user_id]
      @bananas = Banana.find(:all)
      
      for banana in @bananas 
        if banana.user_id == session[:user_id]
          if banana.when_brown == nil
            flash[:notice] = "You already have an exisitng optimization tracker in progress so you can't make another one unitl you finish your old one!"
            redirect_to(:action => "turn_brown")
          else
            @banana = Banana.new 
            @banana.number_of_bananas = 0
            @banana.when_bought = Time.now 
            
          end
        else
           @banana = Banana.new 
            @banana.number_of_bananas = 0
            @banana.when_bought = Time.now       
        end
        
  
    end   
    
    else
      flash[:notice] = "You're gonna have to log in if you want to make a new banana optimizer!"
      redirect_to(:action => "login" )
    end
  end
  
  def create_tracker
    if session[:user_id]
      @banana = Banana.new(params[:banana])
      @banana.user_id = session[:user_id]
      @banana.brown_bananas = 0
      if @banana.number_of_bananas == nil  || @banana.number_of_bananas <= 0
        flash[:notice] = "Error!!!! You have to track at least 1 banana! In simpler words, you need to not have no bananas."
        redirect_to(:action => "new_tracker")
      else
          if @banana.save 
            flash[:notice] = "New banana optimization being tracked, I guess!"
            redirect_to(:action => "tracker_instructions")
          else
            flash[:notice] = "banana optimization tracker thing didn't make for some reason. I blame you."
            render(:action => "new_tracker" )
          end
        end  
        else 
          flash[:notice] = "ERROR!!!: Well you can't make a new optimizer if you're not logged in now can you?"
          redirect_to( :action => "index")
      
  end
end

  def tracker_instructions 
    session[:user_id] = nil
    session[:user_name] = nil
end

  def turn_brown 
    @bananas = Banana.find(:all)
    if session[:user_id]
    for banana in @bananas 
      if banana.user_id == session[:user_id] && banana.when_brown == nil then
        
          @banana = banana
          @banana.when_brown = Time.now
          session[:banana_id] = @banana.id
          render(:action => "turn_brown") and return
        
        end
          
      end
    
  else
    flash[:notice] = "hey! you're not even logged in!"
    redirect_to(:action => "login" ) and return
  end
  
  
          flash[:notice] = "you don't have any unfinished optimizers. make a new one , i guess?"
          redirect_to(:action => "new_tracker" ) and return
  
 end
  
  def create_brown
    @banana = Banana.find(session[:banana_id])
    
    if @banana.update_attributes(params[:banana])
      flash[:notice] = "Banana info updated"
      session[:banana_id] = nil
      redirect_to(:action => "analysis" )
    end
  end
  
  def analysis
    @bananas = Banana.find(:all)
  end
  
  def delete 
    
    @banana = Banana.find(params[:id])
    if @banana.user_id == session[:user_id]
      @banana.destroy
      redirect_to(:action => "analysis") and return
    else   
      flash[:notice] = "Error! Error!"
      redirect_to(:action => "index") and return
    end  
  end
  
  def faq
    
  end
  
  def foundation
    
  end
end 