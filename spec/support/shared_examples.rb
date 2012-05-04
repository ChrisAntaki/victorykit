shared_examples_for "a login protected page" do
  it "allows valid users to carry out the action" do
    session[:user_id] = create(:user).id
    action
    should_not redirect_to login_path
  end
  it "disallows non logged in users to carry out the action" do
    action
    should redirect_to login_path
  end
end

shared_examples_for "an admin only resource page" do
  it "allows valid users to carry out the action" do
    session[:user_id] = create(:admin_user).id
    action
    should_not redirect_to login_path
  end
  it "disallows non admin users to carry out the action" do
    session[:user_id] = create(:user).id
    action
    should_not redirect_to login_path
  end
  it "disallows non logged in users to carry out the action" do
    action
    should redirect_to login_path
  end
end

shared_examples_for "a user with edit permissions resource page" do
  it "allows valid users to carry out the action" do
    user = create(:user)
    session[:user_id] = user.id
    action
    should_not redirect_to login_path
  end
  it "disallows users who did not create the petition to carry out the action" do
    session[:user_id] = create(:user).id
    action
    response.status.should == 403
  end
  it "disallows non super users and non admins to carry out the action" do
    session[:user_id] = create(:user).id
    action
    response.status.should == 403
  end
  it "disallows non logged in users to carry out the action" do
     action
     should redirect_to login_path
   end
end

shared_examples_for "a super-user only resource page" do
  it "allows super users to carry out the action" do
    session[:user_id] = create(:super_user).id
    action
    response.status.should_not == 403
    should_not redirect_to login_path
  end
  it "disallows non super users to carry out the action" do
    session[:user_id] = create(:user).id
    action
    response.status.should == 403
  end
  it "disallows non logged in users to carry out the action" do
    action
    should redirect_to login_path
  end
end
