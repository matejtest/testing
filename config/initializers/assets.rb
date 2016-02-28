# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w(
	signup/signup_validation.js
	session/login_validation.js
	expenses/new_expense_validation.js
	expenses/edit_expense_validation.js
	expenses/edit_expense_datetime_pickers.js
	users/show.js
	expenses/report_validation.js
	users/new_user_validation.js
	users/edit_user_validation.js
	users/admin_users.js
 )

Rails.application.config.assets.precompile << /\w+\.(svg|eot|woff|ttf)\z/