<?xml version="1.0"?>
<template name="Linux Network" description="Linux Network Related Metrics" base-only="yes">
  <questions>
    <question name="total-bandwidth">
      <text>Network Bandwidth available in bytes:</text>
      <default>1250000</default>
      <regex>^\d+$</regex>
      <xpaths>
        <xpath>
          <path>/document/module[@name="Logic_Engine"]/logic/block/foreach/variable[@name="available"]/@value </path>
        </xpath>
      </xpaths>
    </question>
  </questions>
</template>
<!--
vim:ft=xml
-->
