<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "styles">
        <link rel="stylesheet" href="${url.resourcesPath}/css/style.css" />
    </#if>
    <#if section = "scripts">
        <script src="${url.resourcesPath}/js/index.js"></script>
    </#if>
    <#if section = "content">
        <div class="card loading-card">
            <div class="loading-content">
                <div class="loader-large"></div>
                <h2>${msg("pageExpiredTitle", "Session Expired")}</h2>
                <p>${msg("pageExpiredMessage", "Your session has expired. Please restart the login process.")}</p>
                <a href="${url.loginRestartFlowUrl}" class="btn btn-primary">${msg("doRestartLogin", "Restart Login")}</a>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
