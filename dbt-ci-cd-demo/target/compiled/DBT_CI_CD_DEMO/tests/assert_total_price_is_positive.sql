-- Check if the total price is negetive.
select orders.o_totalprice
from DBT_CI_DEMO.SRC.src_orders as orders
where orders.o_totalprice < 0