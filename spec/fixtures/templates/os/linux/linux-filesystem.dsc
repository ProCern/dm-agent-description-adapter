<?xml version="1.0"?>
<template name="Linux File System" description="Disk Space and I-Node Space Metrics" base-only="yes">
  <questions>
    <question name="fs-crit">
      <text>Critical File System Percent Used (greater than or equal to)</text>
      <default>98.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Filesystem|*|pct_used"]/variable[@name = "crit"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <question name="fs-warn">
      <text>Warning File System Percent Used (greater than or equal to)</text>
      <default>98.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Filesystem|*|pct_used"]/variable[@name = "warn"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <question name="inode-crit">
      <text>Critical I-Node Percent Used (greater than or equal to)</text>
      <default>98.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Filesystem|*|inode_pct_used"]/variable[@name = "crit"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <question name="inode-warn">
      <text>Warning I-Node Percent Used (greater than or equal to)</text>
      <default>90.0</default>
      <regex>^[\d.]+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/block[@dkey = "OS|${sysshep.os}|Filesystem|*|inode_pct_used"]/variable[@name = "warn"]/@value</path>
        </xpath>
      </xpaths>
    </question>
    <!-- ====== Jack Woehr 2006-08-28 issue 3187 add ignore question ======== -->
    <question name="linux-filesystem-ignore">
      <text>File Systems to ignore (warning: the regular expression you give must be valid or no file systems will be ignored)</text>
      <default>Filesystem\|/(dev|proc|mnt/cdrom|cdrom)</default>
      <regex>.*</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name = "Logic_Engine"]/logic/ignore[@id = "filesystem-ignore"]/@regex</path>
          <answer>$(answer)</answer>
        </xpath>
      </xpaths>
    </question>
    <!-- =================================================================== -->
  </questions>
</template>
<!--
vim:ft=xml
-->
