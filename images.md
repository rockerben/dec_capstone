### CAPSTONE: Real-Time Development Applications (DAs) in NSW

| Images                                          |
| ----------------------------------------------- |
| Ben - [rockerben](https://github.com/rockerben) |

---

### **Project Plan**

# Proof of Work

---

| ELT Pipeline |
| ------------ |

##### Github, Airbyte, Snowflake, Dbt, Dagster

---

| Tasks |
| ----- |

1.  **Select API**
    &nbsp;
    ![postman](docs/postman.png)
    &nbsp;

2.  **Setup Airbyte to Snowflake connection**
    &nbsp;

    - Source - I used this as reference to help me build the custom connector (https://www.youtube.com/watch?v=IG0B8WXIQgs)
      &nbsp;
    - Destination - we all have a snowflake destination connector setup
      &nbsp;
    - Connection - straight forward
      &nbsp;

    ![airbyte](docs/airbyte.png)
    &nbsp;
    &nbsp;

    ![airbyte2](docs/airbyte2.png)
    &nbsp;
    &nbsp;
    ![airbyte3](docs/airbyte3.png)
    &nbsp;
    &nbsp;
    ![airbyte4](docs/airbyte4.png)
    &nbsp;
    &nbsp;
    ![airbyte5](docs/airbyte5.png)
    &nbsp;
    &nbsp;
    ![airbyte6](docs/airbyte6.png)
    &nbsp;
    &nbsp;
    ![airbyte7](docs/airbyte7.png)
    &nbsp;
    &nbsp;
    ![airbyte8](docs/airbyte8.png)
    &nbsp;
    &nbsp;

    Run an extract in Airbyte to have data in Snowflake (localhost ok) - use the UI to run the sync

3.  **Create a Git Repo**
    &nbsp;

    - [GIT Repository](https://github.com/rockerben/dec_capstone/)
      &nbsp;

4.  **Create a virtual enviroment**
    - dagster requirements - conda create -n dagster python=3.11 - conda activate dagster
      &nbsp;
    - dbt requirements - pip install dbt-core==1.7.0 - pip install dbt-snowflake==1.7.0
      &nbsp;
5.  **Scaffold a dagster project**

    - 2024-04-bootcamp/10-dagster/1/01-ins-ops-jobs/instruction/README.md
      &nbsp;

6.  **Scaffold a dbt project**

    - Video reference: 20240618 @40:00 minute mark
    - 2024-04-bootcamp/06-snowflake-dbt/3/01-evr-dbt-setup/instruction/README.md
      &nbsp;

7.  **_create 1 dbt model and run_**
    &nbsp;
8.  **_configure dbt-dagster integration_**
    &nbsp;
9.  **_test dagster_**
    &nbsp;
10. **_build dbt dim models_**
    &nbsp;
11. **_build dbt fact models_**
    &nbsp;
12. **_test run dbt models_**
    &nbsp;
13. **_build the one big table_**
    &nbsp;
14. **_setup dagster-airbyte integration_**
    &nbsp;
15. **_setup dagster-dbt integration_**
    &nbsp;
16. **_test run dagster_**
    &nbsp;
17. **_setup dagster cloud_**
    &nbsp;
18. **_Other stuff_**

        - Documentation
        - Solution Architecture
        - Project Presentation Materials

    &nbsp;

19. To do:

        - Dagster deepdive
        - Data Vault deepdive
        - Incremental Models
        - Data Testing

    &nbsp;

20. To be continued:
    - CICD
    - Kafka learning
    - Databricks/spark learning
    - preset

---
