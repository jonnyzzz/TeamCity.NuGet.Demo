<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#macro subjMarker>TeamCity</#macro>

<#macro plural val><#if (val > 1 || val == 0)>s</#if></#macro>

<#macro build_agent build>
  <#-- @ftlvariable name="build" type="jetbrains.buildServer.serverSide.SBuild" -->
  <div>Agent: ${build.agentName?html}</div>
</#macro>

<#macro build_comment build>
  <#-- @ftlvariable name="build" type="jetbrains.buildServer.serverSide.SBuild" -->
  <#if build.buildComment??>
    <div>Build comment: <i>${build.buildComment.comment?html}</i> by ${build.buildComment.user.descriptiveName?html}.</div>
  </#if>
</#macro>

<#macro build_changes bean>
  <#-- @ftlvariable name="bean" type="jetbrains.buildServer.notification.impl.ChangesBean" -->
  <#-- @ftlvariable name="webLinks" type="jetbrains.buildServer.serverSide.WebLinks" -->
  <div>
    <#assign modNum=bean.modificationsNumber/>
    <#if (modNum > 0)>
      <hr>
      <div>
        <#assign changesLink><a href='${webLinks.getViewChangesUrl(bean.build)}'>${modNum} change<@plural modNum/></a></#assign>
        Changes included (${changesLink})<#if bean.changesClipped>,
        only ${bean.modifications?size} are shown</#if>.
      </div>
      <#list bean.modifications as mod>
        <#assign pers><#if mod.personal>(personal build)</#if></#assign>
        <#assign description=mod.description?html/>
        <#if description?length == 0><#assign description='&lt;no comment&gt;'/></#if>
        <div>
          <#assign modLink><a href='${webLinks.getChangeFilesUrl(mod.id, mod.personal)}'>${mod.changes?size} file<@plural mod.changes?size/></a></#assign>
          Change ${mod.displayVersion} ${pers} by ${mod.userName} (${modLink}):
          <i>${description?trim}</i>
        </div>
      </#list>
    </#if>
  </div>
</#macro>

<#assign codeStyle>white-space: pre; font-family: monospace;</#assign>

<#macro compilation_errors bean>
  <#-- @ftlvariable name="bean" type="jetbrains.buildServer.notification.impl.CompilationErrorsBean" -->
  <#if bean.hasErrorMessages>
    <div>
      <br />
      <div>Compilation errors</div>
      <hr>
      <#list bean.errorMessages as message>
        <div style='${codeStyle} color: darkred;'>${message?html}</div>
      </#list>
      <#if bean.messagesClipped>
        <div style='${codeStyle}'>&lt;&lt; Error message is clipped &gt;&gt;</div>
      </#if>
    </div>
  </#if>
</#macro>

<#macro test_errors bean>
  <#-- @ftlvariable name="bean" type="jetbrains.buildServer.notification.impl.FailedTestsErrorsBean" -->
  <#if (bean.failedTestCount > 0)>
    <div>
      <br />
      <div>
        Failed Tests Summary: ${bean.failedTestCount}
        <#if (bean.newFailedCount > 0)>(${bean.newFailedCount} new)</#if>
        <#if bean.summariesClipped>, ${bean.testsForSummary?size} are shown.
          See all on <a href='${link.buildResultsLink}'>build results page</a>.
        </#if>
      </div>
      <#list bean.testsForSummary as test>
        <#assign alink><#if test_index < bean.testDetails?size><a href="#${test.testRunId}" title="Go to stacktrace">details &raquo;</a></#if></#assign>
        <div style='${codeStyle} padding-left: 10px;'><#if test.newFailure><b>(new) </b></#if>${test.test.name.asString?html} ${alink}</div>
      </#list>
      <br>
      <div>
        <div>
          Stacktraces
          <#if (bean.failedTestCount > bean.testDetails?size)>(only ${bean.testDetails?size} are shown)</#if>:
        </div>
        <#list bean.testDetails as details>
          <a name="${details.test.testRunId}"/>
          <div style='${codeStyle}'><#if details.new><b>(new) </b></#if>${details.testName?html}</div>
          <div style='${codeStyle} color: darkred;'>${details.details?html}</div>
          <br>
          <br>
        </#list>
      </div>
    </div>
  </#if>
</#macro>

<#macro test_list testNames>
  <#-- @ftlvariable name="testNames" type="java.util.List" -->
  <#list testNames as testName>
* ${testName}
  </#list>
</#macro>

<#macro test_list_html testNames>
  <#-- @ftlvariable name="testNames" type="java.util.List" -->
  <ul>
    <#list testNames as testName>
      <li>${testName?html}</li>
    </#list>
  </ul>
</#macro>

<#macro footer>
============================================================================
Configure email notifications: ${link.editNotificationsLink}
</#macro>

<#macro footerHtml>
<div style='color: #666666;'>
  <hr>
  <a href='${link.editNotificationsLink}'>Configure</a> your email notifications on your settings page.
</div>
</#macro>
