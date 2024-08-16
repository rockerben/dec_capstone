import os
from pathlib import Path

from dagster_dbt import DbtCliResource
from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets


# Resolve path dynamically

from pathlib import Path
# Calculate the path relative to the script's location
dbt_project_dir = Path(__file__).resolve().parent.joinpath(
    "../../../dbt_warehouse").resolve()

print(f"Resolved dbt_project_dir: {dbt_project_dir}")

# Configure dbt project resource
dbt_warehouse_resource = DbtCliResource(project_dir=str(dbt_project_dir))

# dbt_project_dir = Path(
#     "/Users/rckrbnnew/Desktop/capstone/dec_capstone/dbt_warehouse").resolve()
# dbt_warehouse_resource = DbtCliResource(project_dir=os.fspath(dbt_project_dir))

# # configure dbt project resource
# dbt_project_dir = Path(__file__).joinpath(
#     "..", "..",  "..", "..", "dbt_warehouse").resolve()
# print(dbt_project_dir)
# dbt_warehouse_resource = DbtCliResource(project_dir=os.fspath(dbt_project_dir))


# # Dynamically set the dbt_project_dir based on the location of this Python file (__file__)
# dbt_project_dir = Path(__file__).parent.parent / "dbt_warehouse"

# # Resolve the path to get the absolute path
# dbt_project_dir = dbt_project_dir.resolve()

# # Use the resolved path in your Dagster resource
# dbt_warehouse_resource = DbtCliResource(project_dir=os.fspath(dbt_project_dir))


# generate manifest
dbt_manifest_path = (
    dbt_warehouse_resource.cli(
        ["--quiet", "parse"],
        target_path=Path("target"),
    )
    .wait()
    .target_path.joinpath("manifest.json")
)

# load manifest to produce asset defintion


@dbt_assets(manifest=dbt_manifest_path)
def dbt_warehouse(context: AssetExecutionContext, dbt_warehouse_resource: DbtCliResource):
    yield from dbt_warehouse_resource.cli(["run"], context=context).stream()
