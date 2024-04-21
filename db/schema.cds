using {
    cuid,
    managed
} from '@sap/cds/common';

namespace com.logali;

type zde_meins : String(2);
context orders {
    define entity Header:managed {
        key email        : String;
            firstname    : String(30);
            lastname     : String;
            country      : String(30);
            createon     : Date default $now;
            deliverydate : DateTime;
            orderstatus  : Integer;
            imageurl     : String;
            to_Items     : Composition of many Items
                               on to_Items.to_Header = $self;
    }
    define entity Items : cuid, managed {
        Name             : localized String not null;
        Description      : localized String;
        releasedate      : Date default $now;
        discontinueddate : Date;
        price            : Decimal(12, 2);
        Height           : type of price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
        unitofmeasure    : zde_meins;
        to_Header        : Association to Header;
    }
}
