module IgclsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_igcls_path
    elsif action_name == 'edit'
      igcl_path
    end
  end
end
