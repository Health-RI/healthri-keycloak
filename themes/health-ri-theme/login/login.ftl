<#import "template.ftl" as layout>
<#-- The login.ftl file is the main template for the login page. It is responsible for rendering the login form and the social providers. -->
<#-- The template.ftl file is the main layout file for the login theme. It is responsible for rendering the header, footer, and the main content of the page. -->
<#-- The macro `layout.registrationLayout` is defined in template.ftl and is used to render the main layout of the page. -->
<@layout.registrationLayout; section>
    <#if section = "styles">
        <link rel="stylesheet" href="${url.resourcesPath}/css/style.css" />
    </#if>
    <#if section = "scripts">
        <script src="${url.resourcesPath}/js/index.js"></script>
    </#if>
    <#if section = "body">
        <body class="treazure">
            <div class="container v-center js-main">
                <div class="card-group">
                    <div class="card">
                        <div class="logo">
                            <img src="${url.resourcesPath}/img/hri-dataportaal-logo.png" alt="logo" />
                        </div>
                        <div class="title">
                            <h2>${msg("loginTitle")}</h2>
                        </div>
                        <form action="${url.loginAction}" method="post">
                            <div class="form-group">
                                <label for="username">${msg("usernameLabel")}</label>
                                <input class="form-control" placeholder="${msg("usernameLabel")}" autofocus="" type="text" id="username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">${msg("passwordLabel")}</label>
                                <input type="password" class="form-control" placeholder="${msg("passwordLabel")}" autocomplete="off" id="password" name="password" required>
                            </div>
                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" value="true">
                                    <label class="form-check-label" for="rememberMe">
                                        ${msg("rememberMeLabel")}
                                    </label>
                                </div>
                            </div>
                            <button class="btn btn-primary" name="login" id="kc-login" type="submit" value="login">${msg("loginButton")}</button>
                        </form>
                    </div>
                    <#if realm.identityProviders?? && realm.identityProviders?size gt 0>
                    <div class="card">
                        <div class="title">
                            <h2>${msg("externalLoginTitle")}</h2>
                            <p>${msg("externalLoginSubtitle")}</p>
                        </div>
                        <ul class="accounts-list">
                            <#list realm.identityProviders as identityProvider>
                                <li class="account">
                                    <a href="${identityProvider.loginUrl}">
                                        <div class="account-link">
                                            <#if identityProvider.alias == "azuread">
                                                <img src="${url.resourcesPath}/img/azure.png" alt="${identityProvider.displayName}" />
                                            <#elseif identityProvider.alias == "google">
                                                <img src="${url.resourcesPath}/img/google.png" alt="${identityProvider.displayName}" />
                                            <#elseif identityProvider.alias == "microsoft">
                                                <img src="${url.resourcesPath}/img/microsoft.png" alt="${identityProvider.displayName}" />
                                            <#else>
                                                <#-- Fallback for other providers -->
                                                <p>${identityProvider.displayName}</p>
                                            </#if>
                                            <p>${identityProvider.displayName}</p>
                                        </div>
                                    </a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                    </#if>
                </div>
            </div>
        </body>
    </#if>
</@layout.registrationLayout>
