from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .project import dbtlearn1_project


@dbt_assets(manifest=dbtlearn1_project.manifest_path)
def dbtlearn1_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()
    