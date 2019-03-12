Monthly Active Users and Churn Analysis
This work is aimed to provide an understanding of my coding(in SQL), analysis and visualization skills when appplied to calculate the active and churned users on a daily and monthly basis.

Requirements:
* Explore the data to get familiar with it.

* Analyze and visualize the movement on Monthly Active and Churned Users over time: create an analysis that is ready to share with an internal stakeholder that helps them understand the relationship 
between monthly active users and churn.

Getting Started
The following steps listed below will help you get the project up & running on your machine. 

Prerequisites
* Install Aginity from this link: https://www.aginity.com/main/workbench-for-amazon-redshift/
	As an alternative you can also use Datagrip which is the preferred tool in Zapier.
* Install Tableau Reader (freeware) to be able to see this dashboard

Preparing for the exercise
Although tool reccommendations were listed in the exercise it was possible to obtain the necessary figures without modelling and only by running a SQL query.

I picked Aginity as this was the preferred client in Amazon to query a Redshift database so I'm quite familiar with this.

To visualise the data I opted in for Tableau as this is a tool I have access to at this moment but I'd be also comfortable to visualise this in Looker.

Methodology:
* Assuming the business user will not have the privilidges to create temp tables I opted in using common table expressions in this exercise. Otherwise instead of creating the dates sub table I would have preferred to have a date dimension which can be joined to various other tables for all kinds of purposes.

* As the requests were based on user_id I avoided using account_id in the queries. 

* As there were rows where the sum_tasks_used equal to 0 I added a clause to exclude these rows from the result set.

Tableau Visualisation:
Connected to Redshift server from Tableau with the credential provided in the link for the task. 

Data Dictionary:
Active User - A user will be considered active on any day where they have at least one task executed in the prior 28 days. 
Churned User - A user will be considered to be churn the 28 days following their last being considered active
Dorment User - A user who has been churned over 28 days
Churn Rate - Total Churned users / Total Active Users

Findings:
To be able to have a fair analysis of the movements of active/churned/dorment customer numbers analisys should be start on min(date) +56 as only by then the whole customer base can be allocated to their proper segments.
