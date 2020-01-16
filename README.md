# Till Tech Test
## Summary
Implement a system that contains the business logic to produce receipts, based on a json price list and test orders. A .json file has been provided with the list of products sold at this particular coffee shop.

Here are some sample orders you can try - whether you use this information is up to you:
```
Jane
2 x Cafe Latte
1 x Blueberry Muffin
1 x Choc Mudcake
```

Your receipt must calculate and show the correct amount of tax (in this shop's case, 8.64%), as well as correct line totals and total amount. Do not worry about calculating discounts or change yet. Consider what output formats may be suitable.

This project is formed of 4 classes: the Receipt Class is the overall controller class; the Calculator class manages the total price and tax calculations; the Order class receives the customer's order and outputs the order items and the customer; and the Formatter class is responsible for the formatting of the receipt and any date or money formatting. This project has 6 passing tests. 

## How to Install and Run
```bash
> git clone https://github.com/jessmar94/bank_tech_test.git
> cd bank_tech_test
> bundle install
```
Run the below commands in a REPL like IRB
```
2.6.3 :001 > require './lib/receipt'
 => true
2.6.3 :002 > receipt = Receipt.new
 => #<Receipt:0x00007f86cb843628 @order=#<Order:0x00007f86cb843538 @output={}, @customer="">, @calculator=#<Calculator:0x00007f86cb8432b8 @payment={"Tax"=>"$0", "Total"=>"£0"}, @total=0, @tax=0>>
2.6.3 :003 > receipt.input_order("Jane\n2 x Cafe Latte\n1 x Blueberry Muffin\n1 x Choc Mudcake")
 => {"Cafe Latte"=>2, "Blueberry Muffin"=>1, "Choc Mudcake"=>1}
2.6.3 :004 > puts receipt.get_receipt
16/01/2020 17:24
The Coffee Connection
123 Lakeside Way
+1 (650) 360-0708
Jane
Cafe Latte 2 x 4.75
Blueberry Muffin 1 x 4.05
Choc Mudcake 1 x 6.40
Tax: $1.72
Total: $19.95
```

## Plan
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
Jane                     | Cafe details...
2 x Cafe Latte           | cafe latter 2 x 4.75
1 x Blueberry Muffin     | blueberry muffin 1 x 4.05
1 x Choc Mudcake         | choc mudcake 1 x 6.40
                         | Tax: $1.72
                         | Total: $19.95
                         
 ## Project Status 
 This is the status of the project as of 16th Jan 2020. Currently, the project is setup to accept an input with new line breaks. However, the code would need to be adjusted if the input didn't have line breaks by replacing the .tr("\n",", ") function with .tr(" ",", ") in each class where this is used. 
