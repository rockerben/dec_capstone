from dagster import repository
from dagster.analytics.jobs.test_airbyte_job import test_airbyte_job


@repository
def my_repo():
    return [test_airbyte_job]
