package spring

import coolengineer.me.FormattedStringValueConverter
import coolengineer.me.UserPasswordEncoderListener
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    formattedStringConverter FormattedStringValueConverter
}
