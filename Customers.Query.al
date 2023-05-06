query 50500 ADWCustomerQuery
{
    QueryType = API;
    APIPublisher = 'PublisherName';
    APIGroup = 'GroupName';
    APIVersion = 'beta';
    EntityName = 'ADWCustomers';
    EntitySetName = 'ADWCustomers';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {
                Caption = 'Customer No.';
            }
            column(Name; Name)
            {
                Caption = 'Customer Name';
            }
            dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;


                column(Amount; Amount)
                {
                    Caption = 'Amount';
                    Method = Sum;
                }
                column(Amount__LCY_; "Amount (LCY)")
                {
                    Caption = 'Amount LCY';
                    Method = Sum;
                }
            }

        }

    }
}