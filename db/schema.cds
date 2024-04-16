using {
    cuid,
    managed
} from '@sap/cds/common';

namespace com.logali;

define entity Header {
    key ID           : String;
    key email        : String;
        firstname    : String(30);
        lastname     : String;
        country      : String(30);
        createon     : Date;
        deliverydate : DateTime;
        orderstatus  : Integer;
        imageurl     : String;
        to_Items     : Composition of many Items
                               on to_Items.to_header = $self;
}

define entity Items :cuid {
    //key ID               : String(36);
        Name             : localized String not null;
        Description      : localized String;
        releasedate      : Date;
        discontinueddate : Date;
        price            : Decimal(12, 2);
        Height           : type of price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
        to_header  : Association to Header;
}
