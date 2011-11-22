<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>
<#import "responsibility.ftl" as resp>

<#global subject>[<@common.subjMarker/>, INVESTIGATION] You are assigned for investigation of ${project.name}::${buildType.name}</#global>

<#global body>You are assigned for investigation of a build configuration failure.
${project.name}::${buildType.name}, assigned by ${responsibility.reporterUser.descriptiveName}
<@resp.comment responsibility/>

${link.buildTypeConfigLink}
<@common.footer/></#global>

<#global bodyHtml>
<div>
  <div>You are assigned for investigation of a build configuration failure.</div>
  <div><b>${project.name}::${buildType.name}</b>, assigned by ${responsibility.reporterUser.descriptiveName}</div>
  <div><@resp.comment responsibility/></div>
  <br>
  <div>More information at <a href='${link.buildTypeConfigLink}'>build configuration page</a>.</div>
  <@common.footerHtml/>
</div>
</#global>
