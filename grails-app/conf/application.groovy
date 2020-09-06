

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'coolengineer.me.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'coolengineer.me.UserRole'
grails.plugin.springsecurity.authority.className = 'coolengineer.me.Role'
grails.plugin.springsecurity.failureHandler.defaultFailureUrl = '/login/auth'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = "/appUser/showProfile" //TODO: Send to custom target URL after login successful
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/privacypolicy',      access: ['permitAll']],
	[pattern: '/privacypolicy.gsp',      access: ['permitAll']],
	[pattern: '/grails_index',          access: ['ROLE_ADMIN']],
	[pattern: '/grails_index.gsp',      access: ['ROLE_ADMIN']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/register/**', access: ['permitAll']],
	[pattern: '/login/**', access: ['permitAll']],
	[pattern: '/logout/**', access: ['permitAll']],
	[pattern: '/user/**', access: ['ROLE_ADMIN']],
	[pattern: '/role/**', access: ['ROLE_ADMIN']],
	[pattern: '/securityInfo/**', access: ['ROLE_ADMIN']],
	[pattern: '/requestmap/**', access: ['ROLE_ADMIN']],
	[pattern: '/registrationCode/**', access: ['ROLE_ADMIN']],
	[pattern: '/persistentLogin/**', access: ['ROLE_ADMIN']],
	[pattern: '/aclSid/**', access: ['ROLE_ADMIN']],
	[pattern: '/aclObjectIdentity/**', access: ['ROLE_ADMIN']],
	[pattern: '/aclEntry/**', access: ['ROLE_ADMIN']],
	[pattern: '/aclClass/**', access: ['ROLE_ADMIN']],
	[pattern: '/h2-console/**', access: ['ROLE_ADMIN']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

//TODO! remove from release! only for debugging
grails.plugin.springsecurity.logout.postOnly = false

// My configuration
coolengineerme.themes.defaultThemeId = 9