ActiveAdmin.register_page 'UserEvents' do

  content title: 'UserEvents' do
    columns do
      column do
        panel 'User events' do
          table_for User.order('created_at desc').limit(10) do
            column('Email')     {|user| user.email}
            column('Visited links') {|user| link_to 'navigation', admin_visited_links_path(user_id: user.id)}
            column('Sign in')   {|user| link_to 'user sign in', admin_events_path(user_id: user.id, user_action: 'login')}
            column('Sign out')  {|user| link_to 'user sign out', admin_events_path(user_id: user.id, user_action: 'logout')}
            column('Likes')     {|user| link_to 'likes', admin_events_path(user_id: user.id, user_action: 'like%')}
            column('Comments')  {|user| link_to 'comment', admin_events_path(user_id: user.id, user_action: 'comment%')}
            column('Subscribes'){|user| link_to 'subscribe', admin_events_path(user_id: user.id, user_action: '%subscr%')}
          end
        end
      end
    end
  end

end