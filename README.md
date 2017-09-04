# DJango Test App that works with PayPal

## Overview

### Before you start
Log in to https://developer.paypal.com/
Ensure you have a Personal and Business accounts set up as they will be needed to make purchases

### Admin login
username: luhven or luhvenechenique@gmail.com
password: luhven

### Site login
username: cormac72s@gmail.com
password: barnaby

### Paypal Payment
You will need to have set up a PERSONAL user account in Paypal Developer site, in order to make payments
https://developer.paypal.com/

### NGROK
If running locally, must run ngrok before launching project. Download ngrok.exe file from https://ngrok.com/ and save to root folder of project.
Then run with command ngrok http 8000 on windows or ./ngrok http 8000 if using bash
Once ngrok is running you will need to include the forwarding address in the PAYPAL_NOTIFY_URL setting in settings.py
