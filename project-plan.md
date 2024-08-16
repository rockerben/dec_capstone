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

DVDRental: where DVD dreams come true for a dedicated cult following nationwide! Despite a recent plot twist of declining fortunes, our management is on a quest for insights to boost promotions and profits.

Our mission? Serving up juicy analytical datasets to our management and BI team, so they can craft dashboards that’ll have decisions made faster than you can hit "play".

## Consumers

The dataset consumers are our resident data wizards (Data Analysts) and the BI brainiacs. They're conjuring up BI dashboards that'll make revenue changes as clear as a rom-com ending. Then, they'll dazzle senior management with insights so sharp, they'll think we’ve finally cracked the DVD rental code!

## Questions

Management seeks the following information to improve promotions and increase profits:

- The most popular film categories.
- The cities where customers are most likely to rent DVDs.
- The staff members with the highest DVD rentals, to be recognized at annual events.

## Source datasets

The datasets are from DVDRental, where our PostgreSQL server runs a daily "DVD-livery" service!

## Solution architecture

![Logo](https://github.com/rockerben/de-project2/blob/main/assets/elt-architecture.png)

- When it comes to data extraction, we're all about full-on extraction.
- For loading, it's full steam ahead for the initial load, with incremental boosts for ongoing updates.
- And for transformations, we're into aggregation, grouping, casting (not the fishing kind), calculations, joins, renaming—you name it!
