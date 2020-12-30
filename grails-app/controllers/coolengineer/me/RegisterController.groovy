package coolengineer.me

import grails.plugin.springsecurity.ui.ForgotPasswordCommand

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {

    static final String EMAIL_LAYOUT = "/layouts/email"
    static final String FORGOT_PASSWORD_TEMPLATE = "/register/_forgotPasswordMail"

    def forgotPassword(ForgotPasswordCommand forgotPasswordCommand) {
        if (!request.post) {
            ForgotPasswordCommand fpc = new ForgotPasswordCommand()
            return [forgotPasswordCommand: fpc]
        }
        withForm {
            if (forgotPasswordCommand.hasErrors()) {

                return [forgotPasswordCommand: forgotPasswordCommand]
            }

            def user = findUserByUsername(forgotPasswordCommand.username)
            if (!user) {
                forgotPasswordCommand.errors.rejectValue 'username', 'spring.security.ui.forgotPassword.user.notFound'

                return [forgotPasswordCommand: forgotPasswordCommand]
            }

            if (forgotPasswordExtraValidation && forgotPasswordExtraValidation.size() > 0 && forgotPasswordExtraValidationDomainClassName ) {
                redirect uri: generateLink('securityQuestions', [username: forgotPasswordCommand.username])
            } else {
                if (requireForgotPassEmailValidation) {
                    processForgotPasswordEmail(forgotPasswordCommand, user, user?.appUser)
                } else {
                    redirect uri: processForgotPasswordEmail(forgotPasswordCommand, user, user?.appUser)
                }
            }
        }.invalidToken {
            flash.message = "Invalid Form Submission"
            redirect(controller: "login", action: "auth")
        }
    }

    protected def processForgotPasswordEmail(forgotPasswordCommand, user, appUser){

        if(requireForgotPassEmailValidation) {
            String email = uiPropertiesStrategy.getProperty(appUser, 'email')
            if (!email) {
                forgotPasswordCommand.errors.rejectValue 'username', 'spring.security.ui.forgotPassword.noEmail'
                return [forgotPasswordCommand: forgotPasswordCommand]
            }
            uiRegistrationCodeStrategy.sendForgotPasswordMail(
                    forgotPasswordCommand.username, email) { String registrationCodeToken ->

                String url = generateLink('resetPassword', [t: registrationCodeToken])
                String body = forgotPasswordEmailBody

                if (!body) {
                    body = renderEmail(
                            FORGOT_PASSWORD_TEMPLATE, EMAIL_LAYOUT,
                            [
                                    url     : url,
                                    username: user.username
                            ]
                    )
                } else if (body.contains('$')) {
                    body = evaluate(body, [user: user, url: url])
                }

                body
            }
            [emailSent: true, forgotPasswordCommand: forgotPasswordCommand]
        } else {
            return generateLink('resetPassword', [t: uiRegistrationCodeStrategy.sendForgotPasswordMail(forgotPasswordCommand.username)?.token ])
        }
    }

    private String renderEmail(String viewPath, String layoutPath, Map model) {
        String content = groovyPageRenderer.render(view: viewPath, model: model)
        return groovyPageRenderer.render(view: layoutPath, model: model << [content: content])
    }
}
