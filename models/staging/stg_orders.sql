select 
--from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
--from raw customer
c.customername,
c.segment,
c.country,
--from raw product
p.category,
p.productname,
p.subcategory

from {{ ref('raw_orders') }} as o
left join {{ ref('raw_Customer') }} as c on o.customerid = c.customerid
left join {{ ref('raw_product') }} p on o.productid = p.productid

{{limit_data_in_dev('orderdate')}} 