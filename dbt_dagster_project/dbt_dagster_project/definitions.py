from dagster import Definitions
from dagster_dbt import DbtCliResource
from .assets import dbtlearn1_dbt_assets
from .project import dbtlearn1_project
from .schedules import schedules

defs = Definitions(
    assets=[dbtlearn1_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=dbtlearn1_project),
    },
)