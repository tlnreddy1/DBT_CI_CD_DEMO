WITH joindata AS (
    SELECT
        cust.c_custkey,
        cust.c_mktsegment,
        ordr.o_orderdate,
        ordr.o_orderkey,
        ordr.o_orderstatus,
        ordr.o_totalprice
    FROM {{ ref('src_customers') }} AS cust
    INNER JOIN {{ ref('src_orders') }} AS ordr
        ON cust.c_custkey = ordr.o_custkey
),

aggr AS (
    SELECT
        joindata.c_mktsegment,
        sum(joindata.o_totalprice) AS totalprice
    FROM joindata
    GROUP BY joindata.c_mktsegment
)

SELECT * FROM aggr
