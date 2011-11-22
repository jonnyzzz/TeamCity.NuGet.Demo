<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>

<#global subject>[<@common.subjMarker/>, PROBABLY_HANGING] Build ${project.name}::${buildType.name} #${build.buildNumber}</#global>

<#global body>Build ${project.name}::${buildType.name} #${build.buildNumber} is probably hanging ${var.buildShortStatusDescription}.
Estimated duration: ${var.buildDurationEstimate}, overtime: ${var.buildDurationOvertime}
Last message was received on: ${var.buildLastMessageTimestamp} (${var.buildTimeSinceLastMessage} ago)
Agent: ${agentName}
Build results: ${link.buildResultsLink}

${var.buildChanges}
<@common.footer/></#global>

<#global bodyHtml>
<div>
  <div>
    Build <i>${project.name}::${buildType.name} <a href='${link.buildResultsLink}'>#${build.buildNumber}</a></i> is probably hanging
    ${var.buildShortStatusDescription}
  </div>
  <div>Estimated duration: ${var.buildDurationEstimate}, overtime: ${var.buildDurationOvertime}</div>
  <div>Last message was received on: ${var.buildLastMessageTimestamp} (${var.buildTimeSinceLastMessage} ago)</div>
  <@common.build_agent build/>
  <@common.build_comment build/>
  <br>
  <@common.build_changes var.changesBean/>
  <@common.footerHtml/>
</div>
</#global>
