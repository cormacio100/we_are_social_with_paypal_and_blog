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

# Stripe environment variables
STRIPE_PUBLISHABLE = os.getenv('STRIPE_PUBLISHABLE', 'pk_test_nbWefqblVg8HnYsFmpcld8qj')
STRIPE_SECRET = os.getenv('STRIPE_SECRET', 'sk_test_N35jP51CRqW4FKBMa8MAL1A4')

# Paypal environment variables
SITE_HOST = 'code-institute-we-are-social.herokuapp.com'
ALLOWED_HOSTS.append(SITE_HOST)
SITE_URL = 'https://code-institute-we-are-social.herokuapp.com/'
PAYPAL_NOTIFY_URL = 'code-institute-we-are-social.herokuapp.com'	#	your heroku app URL
PAYPAL_RECEIVER_EMAIL = 'cormac.music@gmail.com'	#	your Paypal merchant email

