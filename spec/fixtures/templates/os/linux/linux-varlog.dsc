<?xml version="1.0"?>
<template name="Linux /var/log" description="Monitor log files in /var/log" base-only="no">
  <!-- ====================================================================== -->
  <questions>
    <!-- ====================================================================== -->
    <question name="log-ignore">
      <text>Regular Expression for lines to ignore (warning: given text must be a valid regular expression)</text>
      <default>peer died</default>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Monitor_Logfile"]/key/key[@name = "Parser"]/key[@id = "ignore"]/key[@name = "Pattern"]/value/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- ====================================================================== -->
    <question name="log-crit">
      <text>Regular Expression for lines that are Critical alerts (warning: given text must be a valid regular expression)</text>
      <default>SERIOUS|vx_nospace|EMS|Error|Critical|Failure</default>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Monitor_Logfile"]/key/key[@name = "Parser"]/key[@id = "crit"]/key[@name = "Pattern"]/value/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- ====================================================================== -->
    <question name="log-warn">
      <text>Regular Expression for lines that are Warning alerts (warning: given text must be a valid regular expression)</text>
      <default>Link Down</default>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Monitor_Logfile"]/key/key[@name = "Parser"]/key[@id = "warn"]/key[@name = "Pattern"]/value/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- ====================================================================== -->
  </questions>
  <!-- ====================================================================== -->
</template>
<!--
vim:ft=xml
-->
