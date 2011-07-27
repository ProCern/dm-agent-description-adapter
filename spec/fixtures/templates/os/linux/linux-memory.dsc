<?xml version="1.0"?>
<template name="Linux Memory" description="Linux memory metrics" base-only="yes">
  <!--======================================================================-->
  <questions>
    <!--======================================================================-->
    <question name="swap-alert-type">
      <text>Which set of thresholds should be used to alert on Swap Space</text>
      <choice-list>
        <choice title="Available Megabytes" value="0"/>
        <choice title="Percent Free" value="1"/>
      </choice-list>
      <xpaths>
        <xpath type="remove" when="^0$">
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|DiskSwap|mb_free"]/choose[@id = "pct"]</path>
        </xpath>
        <xpath type="remove" when="^1$">
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|DiskSwap|mb_free"]/choose[@id = "mb"]</path>
        </xpath>
      </xpaths>
    </question>
    <!--======================================================================-->
    <question name="swap-crit">
      <text>Critical: Available Swap Space (in megabytes) (less than or equal to)</text>
      <default>256</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|DiskSwap|mb_free"]/variable[@name = "crit_mb"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!--======================================================================-->
    <question name="swap-warn">
      <text>Warning: Available Swap Space (in megabytes) (less than or equal to)</text>
      <default>512</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|DiskSwap|mb_free"]/variable[@name = "warn_mb"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!--======================================================================-->
    <question name="swap-pct-crit">
      <text>Critical: Available Swap Space (percent free) (less than or equal to)</text>
      <default>25.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|DiskSwap|mb_free"]/variable[@name = "crit_pct_free"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!--======================================================================-->
    <question name="swap-pct-warn">
      <text>Warning: Available Swap Space (percent free) (less than or equal to)</text>
      <default>35.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|DiskSwap|mb_free"]/variable[@name = "warn_pct_free"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!--======================================================================-->
    <question name="memory-minutes">
      <text>Minimum time Memory usage must exceed threshold before alertable (in minutes)</text>
      <default>15</default>
      <regex>^\d+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Catalogue"]/key[@name = "Collection"]/key[@name = "Count"]/value/@value</path>
          <answer>$(answer)m</answer>
        </xpath>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Memory|free_w_buf_mb"]/variable[@name = "minutes"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!--======================================================================-->
    <question name="free-buff-crit">
      <text>Critical: Available Memory Buffers in MB (current buffer space must fall below given threshold and used swap space must exceed threshold from the question below before alertable)</text>
      <default>32</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Memory|free_w_buf_mb"]/variable[@name = "crit_buf"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!--======================================================================-->
    <question name="swap-used-crit">
      <text>Critical: Used Swap Space in MB (used swap space must exceed threshold and buffer space must fall below threshold from above question before alertable)</text>
      <default>200</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Memory|free_w_buf_mb"]/variable[@name = "crit_swap"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!--======================================================================-->
  </questions>
  <!--======================================================================-->
</template>
<!--
vim:ft=xml
-->
