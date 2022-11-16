from django.db import models


class ProductManagerr(models.Manager):

    def is_active(self):
        return self.filter(is_active=True)