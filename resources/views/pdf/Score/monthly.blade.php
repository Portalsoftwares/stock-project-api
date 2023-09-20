<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Laravel</title>
</head>

<body>

    {{-- Loop data transaction --}}
    @foreach ($data as $item)
        <htmlpageheader name="page-header">
            Your Header Content
        </htmlpageheader>
        {{-- <p>Invioce: {{ isset($item->id) ? $item->id : 'null' }}</p> --}}
        {{-- @foreach ($item->invoiceLines as $itemLine)
            <p>Invoice Line: {{ isset($itemLine->line_id) ? $itemLine->line_id : 'null' }}</p>
        @endforeach --}}
        {{-- showing preference data --}}
        {{-- <p>Preference: {{ isset($preference->id) ? $preference->id : 'null' }}</p> --}}
        {{-- showing template option --}}
        {{-- <p>Template Options: {{ isset($template_options->id) ? $template_options->id : 'null' }}</p> --}}

        {{-- Font khmer --}}
        <p style="font-family: khmeros">សួស្ដីលោក លោកស្រី អ្នកនាងកញ្ញាជាទីមេត្រី</p>
        <p style="font-family: khmerossiemreap">សួស្ដីលោក លោកស្រី អ្នកនាងកញ្ញាជាទីមេត្រី</p>
        <p style="font-family: khmerosbattambang">សួស្ដីលោក លោកស្រី អ្នកនាងកញ្ញាជាទីមេត្រី</p>
        <p style="font-family: khmerosmuol">សួស្ដីលោក លោកស្រី អ្នកនាងកញ្ញាជាទីមេត្រី</p>
        <p style="font-family: khmerosmuollight">សួស្ដីលោក លោកស្រី អ្នកនាងកញ្ញាជាទីមេត្រី</p>
        <htmlpagefooter name="page-footer">
            Your Footer Content
        </htmlpagefooter>
        <pagebreak />
    @endforeach
</body>

</html>

<style>
    @page {
        header: page-header;
        footer: page-footer;
        page-break-before: right;
    }

    body {
        font-family: "Roboto", Verdana, Geneva, Tahoma, sans-serif font-size:13px;
        line-height: 24px;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    p {
        padding: 0;
        margin: 0
    }

    .font-khmeros {
        font-family: "khmeros", sans-serif;
    }

    .font-siemreap {
        font-family: "khmerossiemreap", sans-serif;
    }

    .font-muol {
        font-family: "khmerosmuol", sans-serif;
    }

    .font-roboto {
        font-family: "roboto", sans-serif;
    }

    .font-12 {
        font-size: 12px;
        line-height: 16px;
    }

    .font-13 {
        font-size: 13px;
        line-height: 20px;
    }

    .font-14 {
        font-size: 14px;
        line-height: 20px;
    }

    .font-15 {
        font-size: 15px
    }

    .font-16 {
        font-size: 16px;
        line-height: 24px
    }

    .font-17 {
        font-size: 17px
    }

    .font-18 {
        font-size: 18px
    }

    .font-19 {
        font-size: 19px
    }

    .font-20 {
        font-size: 20px
    }

    .font-21 {
        font-size: 21px
    }

    .font-22 {
        font-size: 22px
    }

    .font-23 {
        font-size: 23px
    }

    .font-24 {
        font-size: 24px
    }

    .font-25 {
        font-size: 25px
    }

    .font-26 {
        font-size: 26px
    }

    .font-27 {
        font-size: 27px
    }

    .font-28 {
        font-size: 28px
    }

    .font-30 {
        font-size: 30px
    }

    .font-31 {
        font-size: 31px
    }

    .font-32 {
        font-size: 32px
    }

    .font-33 {
        font-size: 33px
    }

    .font-34 {
        font-size: 34px
    }

    .font-35 {
        font-size: 35px
    }

    .font-36 {
        font-size: 36px
    }

    .font-37 {
        font-size: 37px
    }

    .font-38 {
        font-size: 38px
    }

    .font-39 {
        font-size: 39px
    }

    .font-40 {
        font-size: 40px
    }

    .font-41 {
        font-size: 41px
    }

    .font-42 {
        font-size: 42px
    }

    .font-43 {
        font-size: 43px
    }

    .font-44 {
        font-size: 44px
    }

    .font-45 {
        font-size: 45px
    }

    .font-46 {
        font-size: 46px
    }

    .font-47 {
        font-size: 47px
    }

    .font-48 {
        font-size: 48px
    }

    .font-49 {
        font-size: 49px
    }

    .font-50 {
        font-size: 50px
    }

    .font-51 {
        font-size: 51px
    }

    .font-52 {
        font-size: 52px
    }

    .font-53 {
        font-size: 53px
    }

    .font-54 {
        font-size: 54px
    }

    .font-55 {
        font-size: 55px
    }

    .font-56 {
        font-size: 56px
    }

    .font-57 {
        font-size: 57px
    }

    .font-58 {
        font-size: 58px
    }

    .font-59 {
        font-size: 59px
    }

    .font-60 {
        font-size: 60px
    }

    .font-61 {
        font-size: 61px
    }

    .font-62 {
        font-size: 62px
    }

    .font-63 {
        font-size: 63px
    }

    .font-64 {
        font-size: 64px
    }

    .font-65 {
        font-size: 65px
    }

    .font-66 {
        font-size: 66px
    }

    .font-67 {
        font-size: 67px
    }

    .font-68 {
        font-size: 68px
    }

    .font-69 {
        font-size: 69px
    }

    .font-70 {
        font-size: 70px
    }

    .font-71 {
        font-size: 71px
    }

    .font-72 {
        font-size: 72px
    }

    .font-73 {
        font-size: 73px
    }

    .font-74 {
        font-size: 74px
    }

    .font-75 {
        font-size: 75px
    }

    .font-76 {
        font-size: 76px
    }

    .font-77 {
        font-size: 77px
    }

    .font-78 {
        font-size: 78px
    }

    .font-79 {
        font-size: 79px
    }

    .font-80 {
        font-size: 80px
    }

    .font-81 {
        font-size: 81px
    }

    .font-82 {
        font-size: 82px
    }

    .font-83 {
        font-size: 83px
    }

    .font-84 {
        font-size: 84px
    }

    .font-85 {
        font-size: 85px
    }

    .font-86 {
        font-size: 86px
    }

    .font-87 {
        font-size: 87px
    }

    .font-88 {
        font-size: 88px
    }

    .font-89 {
        font-size: 89px
    }

    .font-90 {
        font-size: 90px
    }

    .font-91 {
        font-size: 91px
    }

    .font-92 {
        font-size: 92px
    }

    .font-93 {
        font-size: 93px
    }

    .font-94 {
        font-size: 94px
    }

    .font-95 {
        font-size: 95px
    }

    .font-96 {
        font-size: 96px
    }

    .font-97 {
        font-size: 97px
    }

    .font-98 {
        font-size: 98px
    }

    .font-99 {
        font-size: 99px
    }

    .font-100 {
        font-size: 100px
    }

    .font-thin {
        font-weight: 100;
    }

    .font-extralight {
        font-weight: 200;
    }

    .font-light {
        font-weight: 300;
    }

    .font-normal {
        font-weight: 400;
    }

    .font-medium {
        font-weight: 500;
    }

    .font-semibold {
        font-weight: 600;
    }

    .font-bold {
        font-weight: 700;
    }

    .font-extrabold {
        font-weight: 800;
    }

    .font-black {
        font-weight: 900;
    }

    .border {
        border: 1px solid #dee2e6 !important
    }

    .border-0 {
        border: 0 !important
    }

    .border-top {
        border-top: 1px solid #dee2e6 !important
    }

    .border-top-0 {
        border-top: 0 !important
    }

    .border-end {
        border-right: 1px solid #dee2e6 !important
    }

    .border-end-0 {
        border-right: 0 !important
    }

    .border-bottom {
        border-bottom: 1px solid #dee2e6 !important
    }

    .border-bottom-0 {
        border-bottom: 0 !important
    }

    .border-start {
        border-left: 1px solid #dee2e6 !important
    }

    .border-start-0 {
        border-left: 0 !important
    }

    .border-primary {
        border-color: #006ee4 !important
    }

    .border-dark {
        border-color: #000 !important;
    }

    .border-secondary {
        border-color: #6c757d !important
    }

    .border-success {
        border-color: #198754 !important
    }

    .border-info {
        border-color: #0dcaf0 !important
    }

    .border-warning {
        border-color: #ffc107 !important
    }

    .border-danger {
        border-color: #dc3545 !important
    }

    .border-light {
        border-color: #f8f9fa !important
    }

    .border-dark {
        border-color: #212529 !important
    }

    .border-white {
        border-color: #fff !important
    }

    .border-1 {
        border-width: 1px !important
    }

    .border-2 {
        border-width: 2px !important
    }

    .border-3 {
        border-width: 3px !important
    }

    .border-4 {
        border-width: 4px !important
    }

    .border-5 {
        border-width: 5px !important
    }

    .m-0 {
        margin: 0 !important
    }

    .mt-0,
    .my-0 {
        margin-top: 0 !important
    }

    .mr-0,
    .mx-0 {
        margin-right: 0 !important
    }

    .mb-0,
    .my-0 {
        margin-bottom: 0 !important
    }

    .ml-0,
    .mx-0 {
        margin-left: 0 !important
    }

    .m-1 {
        margin: 0.25rem !important
    }

    .mt-1,
    .my-1 {
        margin-top: 0.25rem !important
    }

    .mr-1,
    .mx-1 {
        margin-right: 0.25rem !important
    }

    .mb-1,
    .my-1 {
        margin-bottom: 0.25rem !important
    }

    .ml-1,
    .mx-1 {
        margin-left: 0.25rem !important
    }

    .m-2 {
        margin: 0.5rem !important
    }

    .mt-2,
    .my-2 {
        margin-top: 0.5rem !important
    }

    .mr-2,
    .mx-2 {
        margin-right: 0.5rem !important
    }

    .mb-2,
    .my-2 {
        margin-bottom: 0.5rem !important
    }

    .ml-2,
    .mx-2 {
        margin-left: 0.5rem !important
    }

    .m-3 {
        margin: 1rem !important
    }

    .mt-3,
    .my-3 {
        margin-top: 1rem !important
    }

    .mr-3,
    .mx-3 {
        margin-right: 1rem !important
    }

    .mb-3,
    .my-3 {
        margin-bottom: 1rem !important
    }

    .ml-3,
    .mx-3 {
        margin-left: 1rem !important
    }

    .m-4 {
        margin: 1.5rem !important
    }

    .mt-4,
    .my-4 {
        margin-top: 1.5rem !important
    }

    .mr-4,
    .mx-4 {
        margin-right: 1.5rem !important
    }

    .mb-4,
    .my-4 {
        margin-bottom: 1.5rem !important
    }

    .ml-4,
    .mx-4 {
        margin-left: 1.5rem !important
    }

    .m-5 {
        margin: 3rem !important
    }

    .mt-5,
    .my-5 {
        margin-top: 3rem !important
    }

    .mr-5,
    .mx-5 {
        margin-right: 3rem !important
    }

    .mb-5,
    .my-5 {
        margin-bottom: 3rem !important
    }

    .ml-5,
    .mx-5 {
        margin-left: 3rem !important
    }

    .p-0 {
        padding: 0 !important
    }

    .p-1 {
        padding: 0.25rem !important
    }

    .p-2 {
        padding: 0.5rem !important
    }

    .p-3 {
        padding: 1rem !important
    }

    .p-4 {
        padding: 1.5rem !important
    }

    .p-5 {
        padding: 3rem !important
    }

    .px-0 {
        padding-right: 0 !important;
        padding-left: 0 !important
    }

    .px-1 {
        padding-right: 0.25rem !important;
        padding-left: 0.25rem !important
    }

    .px-2 {
        padding-right: 0.5rem !important;
        padding-left: 0.5rem !important
    }

    .px-3 {
        padding-right: 1rem !important;
        padding-left: 1rem !important
    }

    .px-4 {
        padding-right: 1.5rem !important;
        padding-left: 1.5rem !important
    }

    .px-5 {
        padding-right: 3rem !important;
        padding-left: 3rem !important
    }

    .py-0 {
        padding-top: 0 !important;
        padding-bottom: 0 !important
    }

    .py-1 {
        padding-top: 0.25rem !important;
        padding-bottom: 0.25rem !important
    }

    .py-2 {
        padding-top: 0.5rem !important;
        padding-bottom: 0.5rem !important
    }

    .py-3 {
        padding-top: 1rem !important;
        padding-bottom: 1rem !important
    }

    .py-4 {
        padding-top: 1.5rem !important;
        padding-bottom: 1.5rem !important
    }

    .py-5 {
        padding-top: 3rem !important;
        padding-bottom: 3rem !important
    }

    .pt-0 {
        padding-top: 0 !important
    }

    .pt-1 {
        padding-top: 0.25rem !important
    }

    .pt-2 {
        padding-top: 0.5rem !important
    }

    .pt-3 {
        padding-top: 1rem !important
    }

    .pt-4 {
        padding-top: 1.5rem !important
    }

    .pt-5 {
        padding-top: 3rem !important
    }

    .pe-0 {
        padding-right: 0 !important
    }

    .pe-1 {
        padding-right: 0.25rem !important
    }

    .pe-2 {
        padding-right: 0.5rem !important
    }

    .pe-3 {
        padding-right: 1rem !important
    }

    .pe-4 {
        padding-right: 1.5rem !important
    }

    .pe-5 {
        padding-right: 3rem !important
    }

    .pb-0 {
        padding-bottom: 0 !important
    }

    .pb-1 {
        padding-bottom: 0.25rem !important
    }

    .pb-2 {
        padding-bottom: 0.5rem !important
    }

    .pb-3 {
        padding-bottom: 1rem !important
    }

    .pb-4 {
        padding-bottom: 1.5rem !important
    }

    .pb-5 {
        padding-bottom: 3rem !important
    }

    .ps-0 {
        padding-left: 0 !important
    }

    .ps-1 {
        padding-left: 0.25rem !important
    }

    .ps-2 {
        padding-left: 0.5rem !important
    }

    .ps-3 {
        padding-left: 1rem !important
    }

    .ps-4 {
        padding-left: 1.5rem !important
    }

    .ps-5 {
        padding-left: 3rem !important
    }

    .container {
        width: 100%;
        margin: 0;
        padding: 0
    }

    .text-end {
        text-align: right !important
    }

    .text-center {
        text-align: center !important
    }

    .text-start {
        text-align: left !important
    }

    .container {
        width: 100%;
    }

    .row {
        display: inline;
        margin-right: -5px;
        margin-left: -5px;
    }

    .col-1 {
        width: 8.3333333333%;
        float: left
    }

    .col-2 {
        width: 16.6666666667%;
        float: left;
    }

    .col-3 {
        width: 25%;
        float: left
    }

    .col-4 {
        width: 33.3333333333%;
        float: left
    }

    .col-5 {
        width: 41.6666666667%;
        float: left
    }

    .col-6 {
        width: 50%;
        float: left
    }

    .col-7 {
        width: 58.3333333333%;
        float: left
    }

    .col-8 {
        width: 66.6666666667%;
        float: left
    }

    .col-9 {
        width: 75%;
        float: left
    }

    .col-10 {
        width: 83.3333333333%;
        float: left
    }

    .col-11 {
        width: 91.6666666667%;
        float: left
    }

    .col-12 {
        width: 100%;
        float: left
    }

    //bg
    .bg-gray-50 {
        background-color: #f0f0f0;
    }

    .bg-white {
        background-color: #fff;
    }

    .clear {
        clear: both;
    }

    //
    table.items {
        border-width: 1px;
        border-style: solid;
        border-color: #000;
        margin-top: 2rem;
    }

    table.items tr td {
        page-break-inside: avoid;
    }

    table.items tbody tr:last-child {
        border-bottom-width: 1px;
        border-style: solid;
        border-color: #000;
    }

    td {
        vertical-align: top;
    }

    .items td {
        border-left: 0.1mm solid #000000;
        border-right: 0.1mm solid #000000;
    }

    table thead td {
        text-align: center;
        border-width: 1px;
        border-style: solid;
        border-color: #000;
    }

    table tfoot tr td,
    th {
        border-width: 1px;
        border-style: solid;
        border-color: #000;
    }

    table tfoot tr td.noborder {
        border-bottom-width: 0;
        border-left-width: 0;
    }

    .items td.blanktotal {
        background-color: #EEEEEE;
        border: 0.1mm solid #000000;
        background-color: #FFFFFF;
        border: 0mm none #000000;
        border-top: 0.1mm solid #000000;
        border-right: 0.1mm solid #000000;
    }

    .items td.totals {
        text-align: right;
        border: 0.1mm solid #000000;
    }

    .items td.cost {
        text-align: "." center;
    }
</style>
