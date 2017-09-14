from base import *
import dj_database_url

DEBUG = False

DATABASES = {
	#'default': {
	#	'ENGINE': 'django.db.backends.sqlite3',
	#	'NAME': os.path.join(BASE_DIR,'db.sqlite3'),
	#}
	'default': dj_database_url.config('CLEARDB_DATABASE_URL')
}

#	Stripe environment variables
STRIPE_PUBLISHABLE = os.getenv('STRIPE_PUBLISHABLE', 'pk_test_nbWefqblVg8HnYsFmpcld8qj')
STRIPE_SECRET = os.getenv('STRIPE_SECRET', 'sk_test_N35jP51CRqW4FKBMa8MAL1A4')

#	Paypa;l environment variables
SITE_URL = 'http://127.0.0.1:8000'
#PAYPAL_NOTIFY_URL = 'https://b1591e03.ngrok.io/a-very-hard-to-guess-url/'	#	your ngrok URL
PAYPAL_NOTIFY_URL = 'code-institute-we-are-social.herokuapp.com'	#	your heroku app URL
PAYPAL_RECEIVER_EMAIL = 'cormac.music@gmail.com'	#	your Paypal merchant email

