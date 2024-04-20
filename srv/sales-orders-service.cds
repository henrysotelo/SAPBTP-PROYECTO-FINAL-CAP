using { com.logali as orders } from '../db/schema';

service SalesOrders {
    entity Header as projection on orders.Header;
    entity Items  as projection on  orders.Items;
}