products - table
id: bigint(20)
title: varchar(255)
price: double(8,2)
new_price: double(8,2)
in_stock: tinyint(1)
description: text

product_images - table
id: bigint(20)
image: varchar(255)
product_id: bigint(20)