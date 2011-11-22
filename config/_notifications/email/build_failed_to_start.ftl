<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>

<#global subject>[<@common.subjMarker/>, FAILED TO START] Build ${project.name}::${buildType.name} #${build.buildNumber}</#global>

<#global body>Build ${project.name}::${buildType.name} #${build.buildNumber} failed to start ${var.buildShortStatusDescription}.
Agent: ${agentName}
Build results: ${link.buildResultsLink}

${var.buildChanges}
<@common.footer/></#global>

<#global bodyHtml>
<div>
  <div>
    Build <i>${project.name}::${buildType.name} <a href='${link.buildResultsLink}'>#${build.buildNumber}</a></i>
    failed to start ${var.buildShortStatusDescription}
  </div>
  <@common.build_agent build/>
  <@common.build_comment build/>
  <br>
  <@common.build_changes var.changesBean/>
  <@common.footerHtml/>
</div>
</#global>
