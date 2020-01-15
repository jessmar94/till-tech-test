Implement a system that contains the business logic to produce receipts similar to this, based on a json price list and test orders. A .json file has been provided with the list of products sold at this particular coffee shop.

Here are some sample orders you can try - whether you use this information is up to you:

Jane
2 x Cafe Latte
1 x Blueberry Muffin
1 x Choc Mudcake

John
4 x Americano
2 x Tiramisu
5 x Blueberry Muffin

Your receipt must calculate and show the correct amount of tax (in this shop's case, 8.64%), as well as correct line totals and total amount. Do not worry about calculating discounts or change yet. Consider what output formats may be suitable.

Receipt contains:
- date/time of print
- The Coffee Connection, 123 Lakeside May
- Phone: +1 (650) 360-0708
- Table: 1 / [4]
- Customer names
- Item, quantity and price per item e.g. Coffee   1 x 4.50
- Tax: 8.64% (put into monetary value)
- Total

Classes:
- Printer/Display/Format class
- Receipt class - overall 'controller' class
- Order class to read the data and transfer into hash
- Calculator class to manage all the calculation logic?

INPUT     | OUTPUT
Jane                     |
2 x Cafe Latte           | cafe latter 2 x 4.75
1 x Blueberry Muffin     | blueberry muffin 1 x 4.05
1 x Choc Mudcake         | choc mudcake 1 x 6.40
                         | Tax: $1.72
                         | Total: $19.95

John
4 x Americano
2 x Tiramisu
5 x Blueberry Muffin
