using ManagedOrders as service from '../../srv/orders';

annotate service.Headers with {
    imageurl @(UI.IsImageURL: true)
};

annotate service.Headers with {
    orderstatus @title : 'Ordenes Estatus';
    deliverydate @title : 'Fecha de entrega'
};

annotate service.Headers with @(

    HeaderInfo #GeneratedGroup   : {
        TypeName      : 'i18n>Order',
        TypeNamePlural: 'i18n>Orders',
        ImageUrl      : imageurl,
        Title         : {
            $Type: 'UI.DataField',
            Value: email
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: deliverydate
        }
    },

    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Imagen URL',
                Value: imageurl,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Email',
                Value: email,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Primer Nombre',
                Value: firstname,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Apellidos',
                Value: lastname,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Ciudad',
                Value: country,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Creado el',
                Value: createon,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Fecha Entrega',
                Value: deliverydate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Estado',
                Value: orderstatus,
            }
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],

    UI.SelectionFields           : [
        orderstatus,
        deliverydate
    ],


    UI.LineItem                  : [

        {
            $Type: 'UI.DataField',
            Label: '{i18n>imageurl}',
            Value: imageurl,
        },

        {
            $Type: 'UI.DataField',
            Label: 'Email',
            Value: email,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Primer Nombre',
            Value: firstname,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Apellidos',
            Value: lastname,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Ciudad',
            Value: country,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Creado el',
            Value: createon,
        },

        {
            $Type: 'UI.DataField',
            Label: 'Estado',
            Value: orderstatus,
        }

    ],
);
