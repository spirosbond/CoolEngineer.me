package coolengineer.me

import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_APPUSER'])
class RenderThemeController {


    @Secured('permitAll')
    def renderThemes(AppUser appUser) {

    }

    @Secured('permitAll')
    def renderAppUserResume(AppUser appUser) {
        if (appUser == null) {
            if (isLoggedIn())
                appUser = User.findByUsername(sec?.username()).appUser
            else
                appUser = User.findByUsername('demo').appUser
        }
        ResumeTheme resumeTheme
        def targetPath
        try {

            if (params.themeId != null) {
                resumeTheme = ResumeTheme.findById(Long.parseLong(params.themeId))
            } else {
                resumeTheme = appUser.getResumeThemes().last()
            }
            params.themeId = resumeTheme.id
            if (params.default == "1") targetPath = resumeTheme.defaultPath
            else targetPath = resumeTheme.path
            respond appUser, model: [resumeThemePath: targetPath]
        } catch (Exception e) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resumeTheme.label', default: 'Theme'), params.themeId])
            redirect action: "renderThemes"
        }
    }

}
