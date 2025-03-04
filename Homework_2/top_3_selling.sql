WITH SalesByCategory AS (
    SELECT
        c.country_name AS Country,
        cat.category_name AS Category,
        SUM(oi.quantity * oi.price) AS TotalSales
    FROM
        order_items oi
    JOIN
        orders o ON oi.order_id = o.order_id
    JOIN
        customers cust ON o.customer_id = cust.customer_id
    JOIN
        countries c ON cust.country_id = c.country_id
    JOIN
        products p ON oi.product_id = p.product_id
    JOIN
        categories cat ON p.category_id = cat.category_id
    GROUP BY
        c.country_name, cat.category_name
),
RankedSales AS (
    SELECT
        Country,
        Category,
        TotalSales,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY TotalSales DESC) AS Rank
    FROM
        SalesByCategory
)
SELECT
    Country,
    Category,
    TotalSales
FROM
    RankedSales
WHERE
    Rank <= 3
ORDER BY
    Country, Rank;