query 50501 ADWPayJouDocApprovers
{
    QueryType = API;
    APIPublisher = 'PublisherName';
    APIGroup = 'GroupName';
    APIVersion = 'beta';
    EntityName = 'PayJouDocApprovers';
    EntitySetName = 'PayJouDocApprovers';

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
            column(Pay_Jou_Amount; Amount)
            { }
            column(Pay_Jou_Amount__LCY_; "Amount (LCY)")
            { }
            dataitem(Vendor_Ledger_Entry; "Vendor Ledger Entry")
            {
                DataItemLink = "Applies-to ID" = Gen__Journal_Line."Applies-to ID";
                SqlJoinType = LeftOuterJoin;
                DataItemTableFilter = "Applies-to ID" = filter(<> '');

                column(Vendor_Name; "Vendor Name")
                { }
                column(VLE_Document_No_; "Document No.")
                { }
                column(Description; Description)
                { }
                column(VLE_Amount; Amount)
                { }
                column(VLE_Amount__LCY_; "Amount (LCY)")
                { }
                dataitem(Posted_Approval_Entry; "Posted Approval Entry")
                {
                    DataItemLink = "Document No." = Vendor_Ledger_Entry."Document No.";
                    SqlJoinType = LeftOuterJoin;

                    column(Sender_ID; "Sender ID")
                    { }
                    column(Approver_ID; "Approver ID")
                    { }
                    column(Date_Time_Sent_for_Approval; "Date-Time Sent for Approval")
                    { }
                    column(Last_Date_Time_Modified; "Last Date-Time Modified")
                    { }
                }
            }

        }

    }
}