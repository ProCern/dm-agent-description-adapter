<?xml version="1.0"?>
<template name="Linux Disk" description="Disk utilitization metrics" base-only="yes">
  <questions>
    <question name="disk-minutes">
      <text>Minimum time Disk utilitization must exceed threshold before alertable (in minutes)</text>
      <default>15</default>
      <regex>^\d+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Catalogue"]/key[@name = "Collection"]/key[@name = "Count"]/value/@value</path>
          <answer>$(answer)m</answer>
        </xpath>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Disk|*|pct_util"]/variable[@name = "minutes"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <question name="disk-crit">
      <text>Critical Disk Utilization Percentage (greater than or equal to)</text>
      <default>95.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Disk|*|pct_util"]/variable[@name = "crit"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <question name="disk-warn">
      <text>Warning Disk Utilization Percentage (greater than or equal to)</text>
      <default>90.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Disk|*|pct_util"]/variable[@name = "warn"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
    <question name="linux-disk-ignore">
      <text>Devices within /dev to Ignore (warning: the regular expression you give must be valid or no disk devices will be ignored)</text>
      <default>(tap.*)</default>
      <regex>.*</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/ignore[@id = "disk-ignore"]/@regex</path>
          <answer>^OS\|[^|]+\|Disk\|$(answer)</answer>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
  </questions>
</template>
<!--
vim:ft=xml
-->
