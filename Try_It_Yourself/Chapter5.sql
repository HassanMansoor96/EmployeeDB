-- CHAPTER 5
-- Question 1
-- (The formula for the area of a circle is: pi * radius squared.)

SELECT 3.14 * 5 ^ 2;

-- The result is an area of 78.5 square inches.
-- (the result in an area of 506.4506 square centimeters.)
-- Note: You do not need parentheses because exponents and roots take precedence
-- over multiplication. However, you could include parentheses for clarity. This
-- statement produces the same result:

SELECT 3.14 * (5 ^ 2);

--Question 2

-- Franklin County, N.Y., with 7.4%. The county contains the St. Regis Mohawk
-- Reservation. https://en.wikipedia.org/wiki/St._Regis_Mohawk_Reservation

SELECT geo_name,
       state_us_abbreviation,
       p0010001 AS total_population,
       p0010005 AS american_indian_alaska_native_alone,
       (CAST (p0010005 AS numeric(8,1)) / p0010001) * 100
        AS percent_american_indian_alaska_native_alone
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY'
ORDER BY percent_american_indian_alaska_native_alone DESC;

--Question 3

-- California had a median county population of 179,140.5 in 2010, almost double
-- that of New York, at 91,301. Here are two solutions:

-- First, you can find the median for each state one at a time:

SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY';

SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'CA';

-- Or both in one query (credit: https://github.com/Kennith-eng)

SELECT state_us_abbreviation,
       percentile_cont(0.5)
          WITHIN GROUP (ORDER BY p0010001) AS median
FROM us_counties_2010
WHERE state_us_abbreviation IN ('NY', 'CA')
GROUP BY state_us_abbreviation;


