query 50502 ADWPayJouDocuments
{
    QueryType = API;
    APIPublisher = 'PublisherName';
    APIGroup = 'GroupName';
    APIVersion = 'beta';
    EntityName = 'PayJouDocuments';
    EntitySetName = 'PayJouDocuments';

    elements
    {
        dataitem(Gen__Journal_Line; "Gen. Journal Line")
        {
            DataItemTableFilter = "Journal Template Name" = filter('PAYMENT');

            column(Journal_Batch_Name; "Journal Batch Name")
            { }
            column(Jou_Document_No_; "Document No.")
            { }
            column(Journal_Template_Name; "Journal Template Name")
            { }
            dataitem(Vendor_Ledger_Entry; "Vendor Ledger Entry")
            {
                DataItemLink = "Applies-to ID" = Gen__Journal_Line."Applies-to ID";
                DataItemTableFilter = "Applies-to ID" = filter(<> '');
                SqlJoinType = LeftOuterJoin;

                column(Vendor_Name; "Vendor Name")
                { }
                column(VLE_Document_No_; "Document No.")
                { }
                column(Description; Description)
                { }
                column(Amount; Amount)
                { }
                column(Amount__LCY_; "Amount (LCY)")
                { }
                column(Amount_to_Apply; "Amount to Apply")
                { }
            }

        }

    }
}