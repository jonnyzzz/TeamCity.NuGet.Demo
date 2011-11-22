<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>
<#import "responsibility.ftl" as resp>

<#global message>You are assigned for investigation of a build configuration failure.
${project.name}::${buildType.name}, assigned by ${responsibility.reporterUser.descriptiveName}

<@resp.comment responsibility/>
${link.buildTypeConfigLink}</#global>
