<?xml version="1.0"?>
<template name="Linux Core" description="CPU and other general Linux metrics" base-only="yes">
  <!-- =================================================================== -->
  <questions>
    <!-- =================================================================== -->
    <question name="cpu-minutes">
      <text>Minimum time CPU usage must exceed threshold before alertable (in minutes)</text>
      <default>15</default>
      <regex>^\d+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Catalogue"]/key[@name = "Collection"]/key[@name = "Count"]/value/@value</path>
          <answer>$(answer)m</answer>
        </xpath>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|CPU|total|pct_busy"]/variable[@name = "minutes"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
    <question name="cpu-crit">
      <text>Critical CPU Percentage (greater than or equal to)</text>
      <default>99.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|CPU|total|pct_busy"]/variable[@name = "crit"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
    <question name="cpu-warn">
      <text>Warning CPU Percentage (greater than or equal to)</text>
      <default>98.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|CPU|total|pct_busy"]/variable[@name = "warn"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
    <question name="runq-size-alert-onoff">
      <text>Enable alerting for run queue size</text>
      <choice-list>
        <choice title="No" value="0"/>
        <choice title="Yes" value="1"/>
      </choice-list>
      <xpaths>
        <xpath when="^0$" type="remove">
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@id = "runqSizeAlert"]</path>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
    <question name="cpu-load-alert-onoff">
      <text>Enable alerting for the 5 minute load average</text>
      <choice-list>
        <choice title="No" value="0"/>
        <choice title="Yes" value="1"/>
      </choice-list>
      <xpaths>
        <xpath when="^0$" type="remove">
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@id = "la"]/choose</path>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
    <question name="cpu-load-warn">
      <text>Warning Load Average (if enabled) (greater than or equal to)</text>
      <default>4</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@id = "la"]/variable[@name = "warn"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
    <question name="cpu-load-crit">
      <text>Critical Load Average (if enabled) (greater than or equal to)</text>
      <default>6</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@id = "la"]/variable[@name = "crit"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
  </questions>
  <!-- =================================================================== -->
</template>
<!--
vim:ft=xml
-->
