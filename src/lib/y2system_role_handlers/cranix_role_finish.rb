# encoding: utf-8
# ------------------------------------------------------------------------------
# Copyright (c) 2020 Dipl. Ing. Peter Varkoly, Nuernberg, Germany.
require "yast"
module Y2SystemRoleHandlers
  class CranixRoleFinish < Client
    def run
        SCR.Execute(path(".target.bash"), "touch /var/lib/YaST2/reconfig_system")
        SCR.Write(path(".sysconfig.firstboot.FIRSTBOOT_CONTROL_FILE"),  "/etc/YaST2/cranix-firstboot.xml")
        SCR.Write(path(".sysconfig.firstboot.LICENSE_REFUSAL_ACTION"),  "continue")
        SCR.Write(path(".sysconfig.firstboot.FIRSTBOOT_FINISH_ACTION"), "reboot")
        SCR.Write(path(".sysconfig.firstboot"), nil)
        true
    end
  end
end

