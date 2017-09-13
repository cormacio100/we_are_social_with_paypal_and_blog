from django import forms
from django.contrib.auth.forms import UserCreationForm
from accounts.models import User



class UserRegistrationForm(UserCreationForm):
    MONTH_ABBREVIATIONS = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'June',
        'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
    ]
    MONTH_CHOICES = list(enumerate(MONTH_ABBREVIATIONS, 1))
    YEAR_CHOICES = [(i, i) for i in range(2015, 2036)]
 
    credit_card_number = forms.CharField(label='Credit card number')
    cvv = forms.CharField(label='Security code (CVV)')
    expiry_month = forms.ChoiceField(label="Month", choices=MONTH_CHOICES)
    expiry_year = forms.ChoiceField(label="Year", choices=YEAR_CHOICES)
    stripe_id = forms.CharField(widget=forms.HiddenInput)
    password1 = forms.CharField(
        label='Password',
        widget=forms.PasswordInput
    )
 
    password2 = forms.CharField(
        label='Password Confirmation',
        widget=forms.PasswordInput
    )
 
    class Meta:
        model = User
        fields = ['email', 'password1', 'password2', 'stripe_id']
        exclude = ['username']
 
    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
 
        if password1 and password2 and password1 != password2:
            message = "Passwords do not match"
            raise forms.ValidationError(message)
 
        return password2
 
    def clean_email(self):
        email = self.cleaned_data.get('email')

        print('cleaned email is ')
        print(email)

 
        if not email:
            message = "Please enter your email address"
            raise forms.ValidationError(message)
        
        return email
 
    def save(self, commit=True):
        #   send to parent class to but don't save to DB yet
        instance = super(UserRegistrationForm, self).save(commit=False)
 
        


        # automatically set to email address to create a unique identifier
        #instance.email = 'cormac72j@gmail.com'
        instance.username = instance.email
        

        print('instance.email is ')
        print(instance.email)
        print('instance.username is ')
        print(instance.username)
        
        print('********************:')
        print('********************:')
        print('instance DICTIONARY:')
        #for keys,values in instance.items():
          #  print(keys, values)
 
        if commit:
            instance.save()
 
        return instance


class UserRegistrationForm_old(UserCreationForm):
    MONTH_ABBREVIATIONS = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'June',
        'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
    ]
    #MONTH_CHOICES = [(i,i,) for i in xrange(1, 12)]
    MONTH_CHOICES = list(enumerate(MONTH_ABBREVIATIONS,1))
    YEAR_CHOICES = [(i,i,) for i in xrange(2015, 2036)]

    credit_card_number = forms.CharField(label='Credit card number')
    cvv = forms.CharField(label='Security code (CVV)')
    expiry_month = forms.ChoiceField(label="Month", choices=MONTH_CHOICES)
    expiry_year = forms.ChoiceField(label="Year", choices=YEAR_CHOICES)
    stripe_id = forms.CharField(widget=forms.HiddenInput)
    password1 = forms.CharField(
        label='Password',
        widget=forms.PasswordInput
    )

    password2 = forms.CharField(
        label='Password Confirmation',
        widget=forms.PasswordInput
    )

    #   the fields that get displayed
    class Meta:
        model = User
        fields = ['email', 'password1', 'password2', 'stripe_id']
        exclude = ['username']

    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')

        if password1 and password2 and password1 != password2:
            message = "Passwords do not match"
            raise ValidationError(message)

        return password2

    def clean_email(self):
        email = self.cleaned_data.get('email')

        if not email:
            message = "Please enter your email address"
            raise forms.ValidationError(message)

    def save(self, commit=True):
        instance = super(UserRegistrationForm, self).save(commit=False)

        # automatically set to email address to create a unique identifier
        instance.username = instance.email

        if commit:
            instance.save()

        return instance


class UserLoginForm(forms.Form):
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput)

