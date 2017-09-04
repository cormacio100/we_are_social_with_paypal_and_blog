# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('magazines', '0006_auto_20170831_1812'),
    ]

    operations = [
        migrations.AlterField(
            model_name='purchase',
            name='subscription_end',
            field=models.DateTimeField(default=datetime.datetime(2017, 9, 4, 16, 25, 45, 904000, tzinfo=utc)),
        ),
    ]
