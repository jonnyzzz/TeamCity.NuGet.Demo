<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>

<#global subject>[<@common.subjMarker/>, STARTED] Build ${project.name}::${buildType.name} #${build.buildNumber}</#global>

<#global body>Build ${project.name}::${buildType.name} #${build.buildNumber} started<#if build.triggeredBy.triggeredByUser> (triggered by ${build.triggeredBy.user.descriptiveName})</#if>.
Agent: ${agentName}
Build results: ${link.buildResultsLink}

${var.buildChanges}
<@common.footer/></#global>

<#global bodyHtml>
<div>
  <div>
    Build <i>${project.name}::${buildType.name} <a href='${link.buildResultsLink}'>#${build.buildNumber}</a></i> started
    <#if build.triggeredBy.triggeredByUser>(triggered by ${build.triggeredBy.user.descriptiveName})</#if>
  </div>
  <@common.build_agent build/>
  <@common.build_comment build/>
  <br>
  <@common.build_changes var.changesBean/>
  <@common.footerHtml/>
</div>
</#global>
