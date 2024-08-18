from dagster import job, op, ResourceDefinition, build_op_context
from dagster_airbyte import AirbyteResource, load_assets_from_airbyte_instance
from dagster import AutoMaterializePolicy, FreshnessPolicy

# Define the AirbyteResource
airbyte_resource = AirbyteResource(
    host="localhost",
    port="8000",
    username="airbyte",
    password="password",
)

# Load the assets from the Airbyte instance
airbyte_assets = load_assets_from_airbyte_instance(
    airbyte_resource,
    connection_filter=lambda meta: "NSWDAv5Snowflake" in meta.name,
    key_prefix="NSW_DA_Snowflake",
    connection_to_freshness_policy_fn=lambda _: FreshnessPolicy(
        maximum_lag_minutes=5),
    connection_to_auto_materialize_policy_fn=lambda _: AutoMaterializePolicy.eager(),
)

# Define an op to test fetching and using Airbyte assets


@op(required_resource_keys={"airbyte"})
def test_airbyte_op(context):
    airbyte_conn = context.resources.airbyte
    context.log.info("Testing Airbyte connection...")

    # Get the list of connections
    connections = airbyte_conn.get_connections()
    context.log.info(f"Found {len(connections)} connections.")

    # Filter connections based on the name
    nsw_connection = [
        conn for conn in connections if "NSWDAv5Snowflake" in conn["name"]
    ]

    if nsw_connection:
        context.log.info(f"Connection found: {nsw_connection[0]['name']}")
    else:
        context.log.error("NSWDAv5Snowflake connection not found.")

# Create a job to run the op


@job(resource_defs={"airbyte": ResourceDefinition.hardcoded_resource(airbyte_resource)})
def test_airbyte_job():
    test_airbyte_op()


# Execute the job (in a script or for testing)
if __name__ == "__main__":
    # You can also build context for local testing
    context = build_op_context(resources={"airbyte": airbyte_resource})
    test_airbyte_op(context)
