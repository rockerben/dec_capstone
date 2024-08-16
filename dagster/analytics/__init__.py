from dagster import Definitions, load_assets_from_modules
from analytics.assets.airbyte.airbyte import airbyte_assets
from analytics.assets.dbt.dbt import dbt_warehouse, dbt_warehouse_resource

from . import assets

all_assets = load_assets_from_modules([assets])

defs = Definitions(
    assets=[airbyte_assets, dbt_warehouse],
    resources={"dbt_warehouse_resource": dbt_warehouse_resource}


)


""" 

from dagster import Definitions, EnvVar, load_assets_from_package_module

from analytics.jobs import run_weather_etl, run_alpaca_etl
from analytics.resources import PostgresqlDatabaseResource
from analytics.schedules import weather_etl_schedule, alpaca_etl_schedule
from analytics.assets import weather, alpaca
from analytics.assets.airbyte.airbyte import airbyte_assets

weather_assets = load_assets_from_package_module(weather, group_name="weather")
alpaca_assets = load_assets_from_package_module(alpaca, group_name="alpaca")

defs = Definitions(
    assets=[*weather_assets, *alpaca_assets, airbyte_assets],
    jobs=[run_weather_etl, run_alpaca_etl],
    schedules=[weather_etl_schedule, alpaca_etl_schedule],
    resources={
        "postgres_conn": PostgresqlDatabaseResource(
            host_name=EnvVar("postgres_host_name"),
            database_name=EnvVar("postgres_database_name"),
            username=EnvVar("postgres_username"),
            password=EnvVar("postgres_password"),
            port=EnvVar("postgres_port")
        )
    }
)
 """
