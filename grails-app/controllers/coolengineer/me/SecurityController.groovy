package coolengineer.me

import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken

@Secured(['ROLE_ADMIN', 'ROLE_APPUSER'])
class SecurityController {
    SpringSecurityService springSecurityService
    AuthenticationProvider daoAuthenticationProvider

    @Secured('permitAll')
    def auth(User user) {

        println user

        if (User.findByUsername(user.username) == null) {
            println user.errors
            flash.error = message(code: 'sec.login.usernotfound', args: [user.username])
            user.discard()
            redirect uri: grailsApplication.config.getProperty('grails.plugin.springsecurity.failureHandler.defaultFailureUrl')
            return
        }

        try {
            daoAuthenticationProvider.authenticate(new UsernamePasswordAuthenticationToken(user.username, user.password))
            springSecurityService.reauthenticate(user.username, user.password)
            redirect uri: grailsApplication.config.getProperty('grails.plugin.springsecurity.successHandler.defaultTargetUrl')
        } catch (Exception e){
            println e
            flash.error = message(code: 'sec.login.usernamepassmismatch')
            user.discard()
            redirect uri: grailsApplication.config.getProperty('grails.plugin.springsecurity.failureHandler.defaultFailureUrl')
        }
    }
}
