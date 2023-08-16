create database	 PMS ;
use pms ; 
create table users (
	user_id  		int 				primary key auto_increment , 
	name 			varchar(20) 		not null , 
    email 			varchar(50) 		unique , 
    password 		int					not null  , 
    created_at 		datetime			default current_timestamp
)  ;
create table orders (
	order_id 		int  				primary key auto_increment ,
	total 			float   			default 0  ,
    user_id  		int		 			not null , 
    created_at 		datetime			default current_timestamp 
) ;
create table product (
	product_id 		int		  			primary key auto_increment ,
	name 			varchar(20) 		not null , 
    price 			float				default 0 , 
    quantity 		int					default 0  , 
    category_id 	int		  			not null , 
    created_at 		datetime			default current_timestamp
) ;
create table category (
	category_id 	int		  			primary key auto_increment ,
	name 			varchar(20) 		not null, 
    created_at 		datetime			default current_timestamp
) ;	
create table cart (
    cart_id 	    int		  			primary key auto_increment ,
	product_id 		int		  			 not null  , 
    order_id 		int(20)   			 not null ,
	price 			float	 			default 0 , 
    quantity 		int					default 0 , 
    created_at 		datetime			default current_timestamp
) ;
alter table orders add foreign key(`user_id`) references users(`user_id`) ;
alter table product add foreign key(`category_id`) references category(`category_id`) ;
alter table cart add foreign key(`product_id`) references product(`product_id`) ;
alter table cart add foreign key(`order_id`) references orders(`order_id`) ;


 

