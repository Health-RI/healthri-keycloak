<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "styles">
        <link rel="stylesheet" href="${url.resourcesPath}/css/style.css" />
    </#if>
    <#if section = "scripts">
        <script src="${url.resourcesPath}/js/index.js"></script>
    </#if>
    <#if section = "content">
        <#if realm.loginWithEmailAllowed>
        <div class="card">
            <div class="title">
                <h2>${msg("loginTitle")}</h2>
            </div>
            
            <#-- Error message display -->
            <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div id="input-error" class="alert alert-${message.type}" role="alert">
                    <span class="error-text">${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>
            
            <form action="${url.loginAction}" method="post" id="kc-form-login">
                <div class="form-group">
                    <label for="username">${msg("email")}</label>
                    <input class="form-control <#if message?has_content && message.type = 'error'>error</#if>" 
                           placeholder="${msg('email')}" 
                           autofocus="" 
                           type="email" 
                           id="username" 
                           name="username" 
                           value="${(login.username!'')}" 
                           autocomplete="email"
                           aria-describedby="<#if message?has_content && message.type = 'error'>input-error</#if>"
                           required>
                </div>
                <div class="form-group">
                    <label for="password">${msg("passwordLabel")}</label>
                    <input type="password" 
                           class="form-control <#if message?has_content && message.type = 'error'>error</#if>" 
                           placeholder="${msg('passwordLabel')}" 
                           autocomplete="current-password" 
                           id="password" 
                           name="password" 
                           aria-describedby="<#if message?has_content && message.type = 'error'>input-error</#if>"
                           required>
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
        </#if>
        
        <#if social?? && social.providers?? && social.providers?size gt 0>
        <div class="card">
            <div class="title">
                <h2>${msg("externalLoginTitle")}</h2>
                <p>${msg("externalLoginSubtitle")}</p>
            </div>
            <ul class="accounts-list">
                <#list social.providers as p>
                    <li class="account">
                        <a href="${p.loginUrl}" class="social-provider-button">
                            <div class="provider-content">
                                <#if p.alias == "azuread">
                                    <img src="${url.resourcesPath}/img/entraid.png" alt="${p.displayName}" class="provider-icon" />
                                <#elseif p.alias == "google">
                                    <img src="${url.resourcesPath}/img/google.png" alt="${p.displayName}" class="provider-icon" />
                                <#elseif p.alias == "microsoft">
                                    <img src="${url.resourcesPath}/img/microsoft.png" alt="${p.displayName}" class="provider-icon" />
                                <#elseif p.alias == "eduid">
                                    <img src="${url.resourcesPath}/img/eduid.png" alt="${p.displayName}" class="provider-icon" />
                                <#elseif p.alias == "apple">
                                    <img src="${url.resourcesPath}/img/apple.png" alt="${p.displayName}" class="provider-icon" />
                                <#elseif p.alias == "github">
                                    <img src="${url.resourcesPath}/img/github.png" alt="${p.displayName}" class="provider-icon" />
                                </#if>
                                <span class="provider-name">${p.displayName}</span>
                            </div>
                            <svg class="provider-arrow" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M9 18L15 12L9 6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
        </#if>
        
        <#-- Footer with consent and links -->
        <div class="card card-footer">
            <p class="consent-title">${msg("consentTitle")}</p>
            <p class="consent-text">${msg("consentMessage")}</p>
            <div class="footer-links">
                <a href="${msg('privacyPolicyLinkUrl')}" target="_blank" rel="noopener noreferrer">${msg('privacyPolicyLinkText')}</a>
                <span class="separator">|</span>
                <a href="${msg('termsAndConditionsLinkUrl')}" target="_blank" rel="noopener noreferrer">${msg('termsAndConditionsLinkText')}</a>
                <span class="separator">|</span>
                <a href="${msg('cookieLinkUrl')}" target="_blank" rel="noopener noreferrer">${msg('cookieLinkText')}</a>
            </div>
        </div>
    </#if>
    <#if section = "footer">
        <p class="copyright-notice">
            ${msg('copyrightPrefix')}<a href="${msg('copyrightLinkUrl')}" target="_blank" rel="noopener noreferrer">${msg('copyrightLinkText')}</a>${msg('copyrightSuffix')}
        </p>
    </#if>
</@layout.registrationLayout>
