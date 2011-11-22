<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>

<#global message>Build failed to start.
${project.name}::${buildType.name} #${build.buildNumber}, agent ${agentName} ${var.buildShortStatusDescription}
${link.buildResultsLink}</#global>
