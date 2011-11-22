<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>

<#global link>${link.buildResultsLink}</#global>
<#global message>Build ${project.name}::${buildType.name} #${build.buildNumber} failed to start ${var.buildShortStatusDescription} on ${agentName}</#global>
