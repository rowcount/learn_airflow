# Airflow and Migration

## BI Airflow

[stage server](https://airflow-stage.aventogroup.com/home)
[production server](https://airflow-prod.aventogroup.com/home)

In work stage and production server use

* src/dags
* src/plugins

Changes in plugins are not applied automatically, and k8s pods needed to be recreated

for recreatinng pods use [pipeline for recreatre BI Airflow pods](https://gitlab.task4work.info/infrastructure/kubernetes/kube_technical_functions/-/pipelines/new)

<details>
  <summary>Insttruction</summary>
  
  Spoiler text. Note that it's important to have a space after the summary tag. You should be able to write any markdown you want inside the `<details>` tag... just make sure you close `<details>` afterward.
  
  ```javascript
  console.log("I'm a code block!");
  ```
</details>
