# Description
Air Cargo is an aviation company that provides air transportation services for passengers and freight. Air Cargo uses its aircraft to provide different services with the help of partnerships or alliances with other airlines. 
The company wants to prepare reports on regular passengers, busiest routes, ticket sales details, and other scenarios to improve the ease of travel and booking for customers.

# Project Objective:
To focus on identifying the regular customers to provide offers, analyze the busiest route which helps to increase the number of aircraft required and prepare an analysis to determine the ticket sales details. 
This will ensure that the company improves its operability and becomes more customer-centric and a favorable choice for air travel.

# Tasks done as part of the analysis:
1. Create an ER diagram for the given airlines database.
2. Query to create route_details table using suitable data types for the fields, such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. Implement the check constraint for the flight number and unique constraint for the route_id fields. Also, make sure that the distance miles field is greater than 0.
3. Query to display all the passengers (customers) who have travelled in routes 01 to 25. Take data  from the passengers_on_flights table.
4. Query to identify the number of passengers and total revenue in business class from the ticket_details table.
5. Query to display the full name of the customer by extracting the first name and last name from the customer table.
6. Query to extract the customers who have registered and booked a ticket. Use data from the customer and ticket_de6tails tables.
7. Query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table.
8. Query to identify the customers who have travelled by Economy Plus class using Group By and Having clause on the passengers_on_flights table.
9. Query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.
10. Query to create and grant access to a new user to perform operations on a database.
11. Query to find the maximum ticket price for each class using window functions on the ticket_details table.
12. Query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table.
13. For the route ID 4, write a query to view the execution plan of the passengers_on_flights table.
14. Query to calculate the total price of all tickets booked by a customer across different aircraft IDs using rollup function.
15. Query to create a view with only business class customers along with the brand of airlines.
16. Query to create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. Also, return an error message if the table doesn't exist.
17. Query to create a stored procedure that extracts all the details from the routes table where the travelled distance is more than 2000 miles.
18. Query to create a stored procedure that groups the distance travelled by each flight into three categories. The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.
19. Query to extract ticket purchase date, customer ID, class ID and specify if the complimentary services are provided for the specific class using a stored function in stored procedure on the ticket_details table.
#### Condition:
   - If the class is Business and Economy Plus, then complimentary services are given as Yes, else it is No
20. Query to extract the first record of the customer whose last name ends with Scott using a cursor from the customer table.
