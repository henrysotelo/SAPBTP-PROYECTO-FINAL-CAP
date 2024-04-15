using { com.logali as orders } from '../db/schema';

service SalesOrders {
    entity Header as projection on orders.Header;
}