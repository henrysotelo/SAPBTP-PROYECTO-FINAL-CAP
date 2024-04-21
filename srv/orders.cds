using {com.logali.orders as logali} from '../db/schema';

service ManagedOrders {
    entity Headers as projection on logali.Header;
    entity Items   as projection on logali.Items;
}
