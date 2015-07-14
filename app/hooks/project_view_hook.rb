module CustomNotification
  class ProjectViewHooks < Redmine::Hook::ViewListener
    render_on :view_projects_form, partial: 'projects/settings/form'
  end
end
