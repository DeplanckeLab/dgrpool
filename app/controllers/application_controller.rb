class ApplicationController < ActionController::Base
  helper_method :admin?,  :accessible?

  def admin_emails
    return ['romain.rochepeau@epfl.ch', 'jasper.deplancke@epfl.ch', 'nathan.fiorellino@epfl.ch', 'fabrice.david@epfl.ch','vincent.gardeux@epfl.ch']
  end

  def admin?
    current_user and admin_emails.include?(current_user.email)
  end

  def is_admin? u
    u and admin_emails.include?(u.email)
  end

  def accessible? e
    admin? or (e and ((current_user and (e.user_id == current_user.id))))
  end

  def create_key m, n
    tmp_key = Array.new(n){[*'0'..'9', *'a'..'z'].sample}.join
    while m.where(:key => tmp_key).count > 0
      tmp_key = Array.new(n){[*'0'..'9', *'a'..'z'].sample}.join
    end
    return tmp_key
  end


end
