# Health-RI Keycloak Theme

A custom Keycloak theme for Health-RI's authentication portal, featuring a responsive design with Dutch/English language support.

## Features

- **Responsive Design**: Mobile-first approach with Bootstrap-like responsive behavior
- **Multilingual Support**: Dutch and English translations
- **Social Provider Integration**: Styled buttons for Azure AD, Google, Microsoft with dynamic detection
- **Configurable Content**: Email/username login can be conditionally shown based on realm setting: `realm.loginWithEmailAllowed`
- **Brand Consistency**: Uses Health-RI colors, fonts, and partial logo with translatable text overlay
- **Modern UI**: Clean card-based layout with hover effects and smooth transitions

## Theme Structure

```
themes/health-ri-theme/login/
├── template.ftl              # Main template with header, logo, and language switcher
├── login.ftl                 # Login form page
├── login-processing.ftl      # Loading page during authentication
├── login-page-expired.ftl    # Session expired page
├── messages/
│   ├── messages_en.properties # English translations
│   └── messages_nl.properties # Dutch translations
└── resources/
    ├── css/
    │   ├── style.css          # Main stylesheet
    │   └── font/
    │       └── fonts.css      # Lato font definitions
    ├── font/                  # Lato font files
    ├── img/                   # Images and icons
    │   ├── health-ri-partial-logo.svg
    │   ├── azure.png
    │   ├── google.png
    │   └── microsoft.png
    └── js/
        └── index.js           # JavaScript functionality
```

## Configuration

### Realm Settings

The theme adapts based on Keycloak realm configuration:

- **Email Login**: When `loginWithEmailAllowed` is disabled, only social providers are shown
- **Internationalization**: Language switcher appears when multiple locales are enabled
- **Social Providers**: Automatically detects and styles configured identity providers

### Customizable Messages

Key translatable content includes:

- Site name: "National Health Data Portal" / "Nationaal Gezondheidsdataportaal"
- Copyright notice with configurable Health-RI link
- All form labels and error messages
- Social login titles and subtitles

### Color Scheme

The theme uses Health-RI's brand colors:

- **Primary Blue**: `#295BA6` (buttons, links, backgrounds)
- **Base Blue**: `#183D76` (text, logo text)
- **Light Blues**: `#C8D6ED`, `#F2F7FF` (backgrounds, form fields)
- **Accent Yellow**: `#F8AF00` (highlights)

## Installation

1. Copy the `health-ri-theme` folder to your Keycloak `themes/` directory
2. In Keycloak Admin Console, go to Realm Settings → Themes
3. Set Login Theme to "health-ri-theme"
4. Configure internationalization and social providers as needed

## Development

### CSS Structure

- CSS custom properties for consistent theming
- Mobile-first responsive design with breakpoints at 500px, 768px, 414px
- Flexbox layouts for component alignment
- CSS animations and transitions for smooth interactions

### Adding Social Providers

To add a new social provider icon:

1. Add the icon file to `resources/img/`
2. Update `login.ftl` with a new condition:
   ```ftl
   <#elseif p.alias == "provider-name">
       <img src="${url.resourcesPath}/img/provider-icon.png" alt="${p.displayName}" class="provider-icon" />
   ```

### Font Loading

The theme uses Lato font with multiple weights and includes fallbacks for performance and accessibility.

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile browsers (iOS Safari, Chrome Mobile)
- Responsive design works on screens from 320px to desktop

## License

© 2025 Health-RI. All rights reserved.