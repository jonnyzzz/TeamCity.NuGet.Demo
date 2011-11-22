<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>
<#import "responsibility.ftl" as resp>

<#assign subj><@resp.subject responsibility '${project.name}::${buildType.name}'/></#assign>

<#global subject>[<@common.subjMarker/>, INVESTIGATION] ${subj}</#global>

<#global body>${subj}.
<@resp.comment responsibility/>

${link.buildTypeConfigLink}
<@common.footer/></#global>

<#global bodyHtml>
<div>
  <div>${subj}.</div>
  <div><@resp.comment responsibility/></div>
  <br>
  <div>More information at <a href='${link.buildTypeConfigLink}'>build configuration page</a>.</div>
  <@common.footerHtml/>
</div>
</#global>
