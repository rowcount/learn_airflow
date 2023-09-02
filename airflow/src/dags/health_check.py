from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.operators.python import PythonOperator
from airflow.utils.dates import days_ago

CRON_SCHEDULE = '*/5 * * * *'

dag = DAG(
    'health_check',
    schedule_interval=CRON_SCHEDULE,
    max_active_runs=1,
    catchup=False,
    start_date=days_ago(0),
    default_args={
        'owner': 'airflow',
    },
)

with dag:
    start = DummyOperator(
        task_id='start',
    )
    health_check = PythonOperator(
        task_id='health_check',
        python_callable=lambda: print('OK'),
    )
    end = DummyOperator(
        task_id='finish',
    )

    start >> health_check >> end
