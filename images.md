### CAPSTONE: Real-Time Development Applications (DAs) in NSW

| Proof of Work Images |
| -------------------- |

---

| ELT Pipeline |
| ------------ |

##### Github, Airbyte, Snowflake, Dbt, Dagster

---

| 1. Select API |
| ------------- |

![postman](docs/postman.png)

| 2. Setup Airbyte to Snowflake connection |
| ---------------------------------------- |

- Source - I used this as reference to help me build the custom connector (https://www.youtube.com/watch?v=IG0B8WXIQgs)
- Destination - we all have a snowflake destination connector setup
- Connection - straight forward

![airbyte](docs/airbyte.png)
&nbsp;
![airbyte2](docs/airbyte2.png)
&nbsp;
![airbyte3](docs/airbyte3.png)
&nbsp;
![airbyte4](docs/airbyte4.png)
&nbsp;
![airbyte5](docs/airbyte5.png)
&nbsp;
![airbyte6](docs/airbyte6.png)
&nbsp;
![airbyte7](docs/airbyte7.png)
&nbsp;
![airbyte8](docs/airbyte8.png)
&nbsp;

    Run an extract in Airbyte to have data in Snowflake (localhost ok) - use the UI to run the sync

| 3. Create a Git Repo |
| -------------------- |

- [GIT Repository](https://github.com/rockerben/dec_capstone/)

&nbsp;
| 4. Create a virtual enviroment |
| ------------------------------ |

- dagster requirements
  <pre>

```bash
conda create -n dagster python=3.11
conda activate dagster
```

</pre>

- dbt requirements
  <pre>

```bash
pip install dbt-core==1.7.0
pip install dbt-snowflake==1.7.0
```

</pre>

| 5. Scaffold a dagster project |
| ----------------------------- |

- 2024-04-bootcamp/10-dagster/1/01-ins-ops-jobs/instruction/README.md

| 6. Scaffold a dbt project |
| ------------------------- |

- Video reference: 20240618 @40:00 minute mark
- 2024-04-bootcamp/06-snowflake-dbt/3/01-evr-dbt-setup/instruction/README.md

| 7. _create 1 dbt model and run_ |
| ------------------------------- |

![dbt_model](docs/dbt_model.png)
&nbsp;

| 8. _configure dbt-dagster integration_ |
| -------------------------------------- |

![dbtdagster](docs/dbtdagster.png)
&nbsp;

| 9. _test dagster_ |
| ----------------- |

<pre>
cd dagster
pip install -e ".[dev]"
</pre>

| 10. _build dbt dim models_ |
| -------------------------- |

| 11. _build dbt fact models_ |
| --------------------------- |

| 12. _test run dbt models_ |
| ------------------------- |

| 13. _build the one big table_ |
| ----------------------------- |

| 14. _setup dagster-airbyte integration_ |
| --------------------------------------- |

| 15. _test run local dagster_ |
| ---------------------------- |

![dagm1](docs/dagster_materialize1.png)
&nbsp;
![dagm2](docs/dagster_materialize2.png)
&nbsp;
![dagm3](docs/dagster_materialize3.png)
&nbsp;
![dagm4](docs/dagster_materialize4.png)
&nbsp;
![dagm5](docs/dagster_ui1.png)
&nbsp;
![dagm6](docs/dagster_assets.png)
&nbsp;
![dagm1](docs/dagster_assets2.png)
&nbsp;

| 16. _setup dagster cloud_ |
| ------------------------- |

![dagster2](docs/dagster_cloud_error2.png)
&nbsp;
![dagster3](docs/dagster_cloud_error3.png)
&nbsp;
![dagster4](docs/dagster_cloud_error4.png)
&nbsp;

| 17. _Other stuff_ |
| ----------------- |

- Documentation
- Solution Architecture
- Project Presentation Materials

| _artifacts_ |
| ----------- |

![artfct1](docs/snowflake1.png)
&nbsp;
![artfct2](docs/snowflake2.png)
&nbsp;
![artfct3](docs/snowflake3.png)
&nbsp;
![artfct4](docs/snowflake4.png)
&nbsp;
![artfct5](docs/snowflake5.png)
&nbsp;
![artfct6](docs/snowflake6.png)
&nbsp;
![artfct7](docs/snowflake7.png)
&nbsp;
![artfct8](docs/snowflake8.png)
&nbsp;
![artfct9](docs/snowflake9.png)
&nbsp;

| _To do_ |
| ------- |

- Dagster deepdive
- Data Vault
- Incremental Models
- Data Testing

| _To be continued:_ |
| ------------------ |

- CICD
- Kafka
- Databricks/Spark
- preset

---
