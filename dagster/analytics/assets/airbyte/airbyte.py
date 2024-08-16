from dagster import EnvVar, AutoMaterializePolicy, FreshnessPolicy
from dagster_airbyte import AirbyteResource, load_assets_from_airbyte_instance


airbyte_resource = AirbyteResource(
    host="localhost",
    port="8000",
    username="airbyte",
    password="password",
)

# auto materialize policy issue: https://github.com/dagster-io/dagster/issues/18266
airbyte_assets = load_assets_from_airbyte_instance(
    airbyte_resource,
    connection_filter=lambda meta: "NSWDAv5Snowflake" in meta.name,
    key_prefix="NSW_DA_Snowflake",
    connection_to_freshness_policy_fn=lambda _: FreshnessPolicy(
        maximum_lag_minutes=5),
    connection_to_auto_materialize_policy_fn=lambda _: AutoMaterializePolicy.eager(),
)
