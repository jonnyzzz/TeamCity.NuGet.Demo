<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#macro testInfo tests>
  <#compress>
    <#if tests?size == 1>
      Test ${tests[0].name} is
    <#else>
      ${tests?size} tests are
    </#if>
  </#compress>
</#macro>

<#macro inScope scopeBean>
  <#compress>
    <#if scopeBean.inProject>
      in project ${scopeBean.project.name}
    </#if>
    <#if scopeBean.inBuildType>
      in <#list scopeBean.buildTypes as bt>${bt.name}<#if bt_has_next>, </#if></#list>
      (in ${scopeBean.buildTypesProject.name})
    </#if>
    <#if scopeBean.inBuild>
      in build #${scopeBean.build.buildNumber}
    </#if>
  </#compress>
</#macro>

<#macro unmute unmuteModeBean>
  <#compress>
    <#if unmuteModeBean.manually>
      The tests will not be unmuted automatically.
    </#if>
    <#if unmuteModeBean.whenFixed>
      Each test will be unmuted automatically when passes successfully.
    </#if>
    <#if unmuteModeBean.byTime>
      The tests will be unmuted automatically on ${unmuteModeBean.unmuteTime}.
    </#if>
  </#compress>
</#macro>

<#macro unmutedReason unmuteModeBean scopeBean>
  <#compress>
    <#if unmuteModeBean.whenFixed>
      Unmute reason: all tests passed successfully <@mute.inScope scopeBean/>.
    </#if>
    <#if unmuteModeBean.byTime>
      Unmute reason: automatically on ${unmuteModeBean.unmuteTime}.
    </#if>
  </#compress>
</#macro>

<#macro comment muteInfo>
  <#compress>
    <#if muteInfo.mutingComment??>
      Comment: ${muteInfo.mutingComment?html}
    </#if>
  </#compress>
</#macro>
