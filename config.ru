require './config/environment'

begin
  fi_check_migration


  run ApplicationController

end
