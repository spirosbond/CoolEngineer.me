package coolengineer.me

import org.springframework.security.access.annotation.Secured

@Secured('permitAll')
class HomepageController {

    def index() {
        println "Entering Homepage Controller"
        def url = request.getRequestURL()
//        println "request.getRequestURI(): " + request.getRequestURI()
        println "url: " + url
//        println "request.serverName: " + request.serverName
//        println "request.siteUrl: " + request.siteUrl
        println "grailsApplication?.config?.myserver?.url: " + grailsApplication?.config?.myserver?.url

        if (url.toString().contains('http://' + grailsApplication?.config?.myserver?.url) || url.toString().contains('www.' + grailsApplication?.config?.myserver?.url) || url.toString().contains('ngrok')) {
            if (params.flash_message != null) flash.message = params.flash_message
            render view: "/index.gsp"
            return
        }

        try {
            def username = url.substring(url.indexOf("/") + 2, url.indexOf("."))

            println username
            def appUser = User.findByUsername(username).appUser
            render(view: 'showAppUserResume', model: [resumeThemePath: appUser.getResumeThemes().last().path, appUser: appUser])
        } catch (Exception e) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appUser.label', default: 'User'), url])
            redirect uri: "http://" + grailsApplication?.config?.myserver?.url, params: [flash_message: flash.message]
        }
    }

}
