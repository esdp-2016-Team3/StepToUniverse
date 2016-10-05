ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Info" do
          span "Добро пожаловать в панель Администратора "
        end
      end
      column do
          panel "Recent Customers" do
          table_for Content.all.each do |content|
            column(:title)    {|content| link_to(content.title, content_path(content)) }
          end
        end
      end
    end
  end 
end
