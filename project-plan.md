# Project plan

1. Project Overview
   The project involves integrating the DA Open APIs provided by the NSW Department of Planning, Industry, and Environment. This API service allows access to a public dataset containing all Development Application (DA) records lodged since December 2018, with filtering options like council names, application types, development categories, and more.

2. Objectives
   Enable data retrieval for development applications using configurable filters.
   Automate daily updates for fetching the latest DA records.
   Provide insights and reporting on DA applications for various stakeholders (e.g., local councils, urban planners).
3. Project Scope
   The integration will include:

API integration with the ePlanning Datawarehouse.
Implementation of filterable parameters (e.g., CouncilName, ApplicationType).
Development of a front-end dashboard or reporting tool for visualizing the DA data.
Establishing daily data sync and updates.

## Objective

**Objective**: To wrangle the DA Open APIs into a super-slick data pipeline that fetches, stores, and processes development application data faster than a dancing kangaroo on caffeine. We’ll use this data to whip up insights, conjure metrics, which will help my company (The Hills Shire Council) stay ahead of the curve in urban planning and development monitoring.

## Consumers

1. Council Decision Makers & Urban Planners
2. Council Compliance Officers
3. Council’s Finance and Budgeting Team
4. Community and Public Relations Teams
5. Data Analysts and Researchers
6. Developers and Real Estate Professionals
7. Local Government Partners (e.g., DPIE)
8. Public Stakeholders (Community Members, NGOs)

## Questions

The DA Open APIs dataset can help answer a variety of key questions that provide actionable insights for the council and its stakeholders. Here are some critical questions that can be addressed using this dataset:

### For Urban Planners & Council Decision Makers:

1. What is the distribution of development applications across different councils?
2. What types of developments are most common in specific areas (residential, industrial, commercial)?
3. Are there any patterns in development application approval times across different councils?
4. How is the cost of developments trending over time in specific council areas?
5. Which development categories (e.g., residential, industrial) are growing the fastest?

### For Compliance Officers:

6. How many development applications are currently under assessment or awaiting additional information?
7. Are there any regions with high numbers of rejected or deferred applications?
8. What percentage of development applications involve subdivision proposals, and what type of subdivisions are being applied for (e.g., Strata Title, Torrens Title)?
9. Are there developments proposing significant variations to planning standards (e.g., height limits, floor space ratio)?

### For Finance and Budgeting Teams:

10. What is the total estimated cost of developments across council areas for a given period?
11. Which large-scale developments (by cost) are likely to impact infrastructure or require special budgeting considerations?
12. Are there clusters of high-cost developments in particular regions?

### For Data Analysts & Researchers:

13. How have application trends changed since 2018, particularly in response to economic conditions?
14. Is there a correlation between the type of development (e.g., residential vs. industrial) and the time taken to approve applications?
15. What is the geographic distribution of new dwellings, and are there clusters of high-density developments?
16. How many applications include variations to development standards, and what types of variations are most common?

### For Developers & Real Estate Professionals:

17. Which council areas have the most active or pending applications, and what types of developments are popular there?
18. What is the average cost of development applications in specific categories (e.g., residential vs. commercial) by council area?

### For Public Relations & Community Stakeholders:

19. Which development applications are currently on exhibition, and when are their public consultation periods ending?
20. How many applications have been determined (approved/rejected) within a certain timeframe in a particular region?
21. What are the most common reasons for rejection of development applications across different council areas?

### For Public Stakeholders & NGOs:

22. Are there specific regions where certain types of developments (e.g., industrial) are being concentrated, and how might that impact the community?
23. How many development applications involve environmentally sensitive areas or are subject to special infrastructure contributions (SIC)?
24. Which development applications are accompanied by voluntary planning agreements (VPAs), and what is the status of these agreements?

## Source datasets

https://www.planningportal.nsw.gov.au/opendata/dataset/online-da-data-api

Data Broker EMAIL
URL: mailto:data.broker@environment.nsw.gov.au
Contact Data Broker to request datasets.

## Solution architecture

![ELT Architecture](docs/elt.drawio.png)
