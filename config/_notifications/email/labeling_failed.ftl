<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>

<#global subject>[<@common.subjMarker/>, LABELING FAILED] ${project.name}::${buildType.name} #${build.buildNumber}</#global>

<#global body>Labeling failed for root '${vcsRoot.name}'.
Build results: ${link.buildResultsLink}

${var.labelingFailureStacktrace}
<@common.footer/></#global>

<#global bodyHtml>
<div>
  <div>Labeling failed for root <b>'${vcsRoot.name}'</b>.</div>
  <div>More details on <a href='${link.buildResultsLink}'>build results page</a></div>
  <br>
  <div style='white-space: pre; font-family: monospace; color: darkred;'>${var.labelingFailureStacktrace}</div>
  <@common.footerHtml/>
</div>
</#global>
