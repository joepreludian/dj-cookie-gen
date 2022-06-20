from abc import ABC

from storages.backends.s3boto3 import S3StaticStorage

from core.settings import PROJECT_BASE_STATIC_BUCKET


class StaticSiteStorage(S3StaticStorage, ABC):
    bucket_name = PROJECT_BASE_STATIC_BUCKET