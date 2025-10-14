<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "styles">
        <link rel="stylesheet" href="${url.resourcesPath}/css/style.css" />
    </#if>
    <#if section = "content">
        <div class="card loading-card loading-page">
            <div class="loading-content">
                <div class="loader-large"></div>
                <h2>${msg("pageLoadingTitle", "Loading")}</h2>
                <p>${msg("pageLoadingMessage", "Please wait while we process your request...")}</p>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
