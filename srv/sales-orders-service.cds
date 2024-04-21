using {com.logali.orders as logali} from '../db/schema';

service ServiceOrders {


    entity header        @(
        Capabilities.Insertable: true,
        Capabilities.Updatable : true
    )           as
        select from logali.Header {
            email       @mandatory,
            firstname   @mandatory,
            lastname,
            country,
            createon,
            orderstatus @readonly,
            deliverydate,
            imageurl,
            to_Items
        };

    entity Item as
        select from logali.Items {
            ID,
            Name,
            Description,
            releasedate,
            discontinueddate,
            price,
            Height,
            Width,
            Depth,
            Quantity @(
                mandatory,
                assert.range : [
                    0.00,
                    20.00
                ]
            ),
            to_Header 
        };

}
