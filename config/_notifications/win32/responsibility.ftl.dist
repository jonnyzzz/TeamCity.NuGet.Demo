<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#macro subject responsibility object>
  <#compress>
    <#if responsibility.state.active>
      <#if responsibility.reporterUser?? && responsibility.responsibleUser?? &&
           responsibility.reporterUser.id == responsibility.responsibleUser.id>
        ${responsibility.responsibleUser.descriptiveName} started investigation of ${object}
      <#else>
        <#assign byWhom>
          <#if responsibility.reporterUser??>by ${responsibility.reporterUser.descriptiveName}</#if>
        </#assign>
        ${responsibility.responsibleUser.descriptiveName} is assigned for investigation of ${object} ${byWhom}
      </#if>
    </#if>
    <#if responsibility.state.fixed>
      ${responsibility.responsibleUser.descriptiveName} fixed ${object}
    </#if>
    <#if responsibility.state.givenUp>
      ${responsibility.responsibleUser.descriptiveName} gave up fixing ${object}
    </#if>
  </#compress>
</#macro>

<#macro comment responsibility>
<#if responsibility.comment?length != 0>
Comment: ${responsibility.comment?html}
</#if>
</#macro>
