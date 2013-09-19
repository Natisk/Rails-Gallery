ActiveAdmin.register Event do

  menu false

  index title: proc{params[:user_id].blank? ? 'Events' : "Events > #{User.find(params[:user_id]).email}"} do
    selectable_column
    column :id
    column :user_action
    column :created_at
  end

  controller do

    def scoped_collection
      Event.where('user_id = :user_id AND user_action LIKE :user_action', user_id: params[:user_id],
                  user_action: params[:user_action])
    end

  end

end