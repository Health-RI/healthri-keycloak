<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link rel="icon" href="${url.resourcesPath}/img/favicon.svg" type="image/svg+xml" />
    
    <#-- Preload and cache background image to prevent glitching -->
    <link rel="preload" as="image" href="${url.resourcesPath}/img/hri-login-background.jpg" fetchpriority="high" />
    
    <#nested "styles">
</head>
<body class="health-ri">
    <div class="container v-center js-main">
        <div class="login-wrapper">
            <div class="card-group">
                <#-- Language Switcher and Logo at the top -->
                <div class="card header-card">
                    <div class="header-content">
                        <#-- Logo on the left -->
                        <a href="${msg("logoLinkUrl", "https://healthdata.nl")}" class="logo site-logo" rel="home">
                            <img src="${url.resourcesPath}/img/health-ri-partial-logo.svg" alt="Health-RI" />
                            <span class="site-name">${msg("siteName", "National Health Data Portal")}</span>
                        </a>
                        
                        <#-- Empty div for flex spacing (middle) -->
                        <div class="header-spacer"></div>
                        
                        <#-- Language Switcher on the right -->
                        <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                            <div class="language-dropdown">
                                <button class="language-toggle" aria-label="${msg("selectLanguage", "Select language")}">
                                    <span class="language-current">${locale.current}</span>
                                    <svg class="language-icon" width="16" height="16" viewBox="0 0 16 16" fill="none">
                                        <path d="M4 6L8 10L12 6" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                    </svg>
                                </button>
                                <ul class="language-menu">
                                    <#list locale.supported as l>
                                        <li>
                                            <a href="${l.url}" class="language-option ${(locale.current == l.label)?then('active', '')}">
                                                ${l.label}
                                            </a>
                                        </li>
                                    </#list>
                                </ul>
                            </div>
                        </#if>
                    </div>
                </div>
                
                <#-- Page content goes here -->
                <#nested "content">
                
            </div>
            
            <#-- Content outside card-group (e.g., copyright) -->
            <#nested "footer">
        </div>
    </div>
    
    <#nested "scripts">
</body>
</html>
</#macro>