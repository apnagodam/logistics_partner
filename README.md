# Official Documentation for Apna Godam Logistics Partner app ---

![img_4286a-350x233](https://apnagodam.com/resources/assets/upload/appearance/e3e979.png)


## Base Url - https://apnagodam.com/api/
## Base Test Url - https://apnagodam.com/test/api/

## Lp Api Url 
Base Url - https://apnagodam.com/lp_api/
Base Test Url - https://apnagodam.com/test/lp_api/

### Send OTP
https://apnagodam.com/test/api/apna_send_otp?number=9828106525&app_type=LP

### Verify OTP
https://apnagodam.com/test/api/apna_verify_otp?number=9828106525&otp=123456&language=hi

### Duty Offline_Online API
https://apnagodam.com/test/lp_api/apna_lp_online_offline?online_offline=1

### Auto Accept
https://apnagodam.com/test/lp_api/apna_lp_auto_accept

### Commodity Type
https://apnagodam.com/test/api/commodity-parameter?id=8

### Commodity Calculation
https://apnagodam.com/test/lp_api/calculate-qv?order_id=1802&rate=25&parameters[0][id]=8&parameters[0][name]=barley&parameters[0][min]=12&parameters[0][max]=18&parameters[0][actual]=12&parameters[0][value]=12

### Current orders
https://apnagodam.com/test/lp_api/apna_lp_all_current_bookings?limit=5

### All Orders
https://github.com/apnagodam/Ag-logistics-partner/blob/master/app/src/main/java/com/apnagodam/ag/lp/networ

### Commodity quality calculations
https://apnagodam.com/test/lp_api/calculate-qv?order_id=1802&rate=7001&parameters[0][id]=8&parameters[0][name]=barley&parameters[0][min]=12&parameters[0][max]=18&parameters[0][actual]=12&parameters[0][value]=12&parameters[1][id]=8&parameters[1][name]=barley&parameters[1][min]=12&parameters[1][max]=18&parameters[1][actual]=12&parameters[1][value]=12&parameters[2][id]=8&parameters[2][name]=barley&parameters[2][min]=12&parameters[2][max]=18&parameters[2][actual]=12&parameters[2][value]=12&parameters[3][id]=8&parameters[3][name]=barley&parameters[3][min]=12&parameters[3][max]=18&parameters[3][actual]=12&parameters[3][value]=12

### Commodity Quality Update 
https://apnagodam.com/test/lp_api/apna_lp_quality_update?booking_id=1836&final_price=5&quality_variation[0][name]="barley"&quality_variation[0][min]=12&quality_variation[0][max]=18&quality_variation[0][actual]=12&quality_variation[0][value]=12&quality_variation[0][qv]=12

