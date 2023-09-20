<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{{ }} {{ date('d m Y') }}</title>
</head>

<body>
    {{-- Loop data transaction --}}
    {{-- {{dd(count($data))}} --}}
    @php($t = 1)
    @foreach ($data as $key => $item)
        <div class="container">
            <div class="row border-bottom border-dark  pb-2">
                <div class="col-12">
                    <div class="container mb-2">
                        <div class="row ">
                            <div class="col-2 ">
                                {{-- @if (!empty($preference->phone_other) && !empty($preference->phone) && !empty($preference->email) && !empty($preference->website))
                                    <div class="box pt-7" width="100px">
                                        <img src="{{ $preference->logo_url }}" width="100px" />
                                    </div>
                                @elseif(empty($preference->phone_other) && empty($preference->phone) && empty($preference->email) && empty($preference->website))
                                    <div class="box pt-5" width="100px">
                                        <img src="{{ $preference->logo_url }}" width="100px" />
                                    </div>
                                @elseif(empty($preference->phone_other) && !empty($preference->phone) && !empty($preference->email) && !empty($preference->website))
                                    <div class="box pt-7" width="100px">
                                        <img src="{{ $preference->logo_url }}" width="100px" />
                                    </div>
                                @elseif(!empty($preference->phone_other) && empty($preference->phone) && !empty($preference->email) && !empty($preference->website))
                                    <div class="box pt-7" width="100px">
                                        <img src="{{ $preference->logo_url }}" width="100px" />
                                    </div>
                                @else
                                    <div class="box pt-6" width="100px">
                                        <img src="{{ $preference->logo_url }}" width="100px" />
                                    </div>
                                @endif --}}
                            </div>
                            <div class=" col-10">
                                <div class="row text-center">
                                    <div class="col-12 text-center ">
                                        <div class="pb-4" style="vertical-align: middle; margin-left: -110px">
                                            <div class=" text-center">
                                                <h1 class="font-muollight  font-16">
                                                    {{-- {{ $preference->name_of_enterprise }} --}}
                                                </h1>
                                                <span class="font-roboto font-roboto-bold">
                                                    {{-- {{ $preference->name_of_enterprise_other }} --}}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4 font-siemreap font-12 ">លេខអត្តសញ្ញាណកម្ម អតប (VAT-TIN)
                                    </div>
                                    <div class="col-8">
                                        <div class="vattin" style="vertical-align: middle; ">
                                            {{-- @if (!empty($preference->tin))
                                                @foreach (str_split($preference->tin) as $rows)
                                                    <div class="{{ $rows == '-' ? 'tin-none' : 'tin' }} ">
                                                        {{ $rows }}
                                                    </div>
                                                @endforeach
                                            @endif --}}
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="col-12">
                                        <div class="font-siemreap font-12 mt-1">អាសយដ្ឋាន:
                                            {{-- {{ $preference->current_address }} --}}
                                        </div>
                                        <div class="font-roboto font-12 mt-1">Address:
                                            {{-- {{ $preference->current_address_other }} --}}
                                        </div>
                                    </div>
                                    <div class="col-12 mt-1">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @yield("body{$key}")
        </div>
        <htmlpagefooter name="invoiceFooter" class="text-center">
            <div class="text-center font-roboto font-12">
                Page {PAGENO} of {nbpg}
            </div>
        </htmlpagefooter>
        @if ($t < $data->count())
            <pagebreak resetpagenum="1" pagenumstyle="nbpg" suppress="off" />
        @endif
        @php($t++)
    @endforeach
</body>

</html>
<style>
    @page {
        /* header: html_invoiceheader; */
        size: 21cm 29.7cm;
        footer: html_invoiceFooter;
        /* margin-header: 10mm; */
        margin-footer: 10mm;
        /* marks:crop;  */
    }

    * {
        box-sizing: border-box
    }

    body {
        font-family: "roboto", sans-serif font-size:13px;
        line-height: 16px
    }

    .box {
        float: left;
        width: 200px;
        margin-top: 10px
    }

    .box1 {
        float: right;
        width: 300px
    }

    .clearfix {
        width: 500px
    }

    .clearfix::after {
        content: "";
        clear: both;
        display: table
    }

    .logo {
        width: 75px;
        position: absolute;
        top: 30px;
        background-color: #ccc
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    p {
        padding: 0;
        margin: 0;
        font-weight: normal
    }

    .font-khmeros {
        font-family: "khmeros", sans-serif
    }

    .font-siemreap {
        font-family: "khmerossiemreap", sans-serif
    }

    .font-battambang {
        font-family: "khmerosbattambang", sans-serif
    }

    .font-muol {
        font-family: "khmerosmuol", sans-serif
    }

    .font-muollight {
        font-family: "khmerosmuollight", sans-serif
    }

    .font-roboto {
        font-family: "roboto", sans-serif
    }

    .font-roboto-bold {
        font-family: "roboto", sans-serif;
        font-weight: bold
    }

    .font-10 {
        font-size: 10px;
        line-height: 16px
    }

    .font-11 {
        font-size: 11px;
        line-height: 16px
    }

    .font-12 {
        font-size: 12px;
        line-height: 16px
    }

    .font-13 {
        font-size: 13px;
        line-height: 18px
    }

    .font-14 {
        font-size: 14px;
        line-height: 20px
    }

    .font-15 {
        font-size: 15px;
        line-height: 22px
    }

    .font-16 {
        font-size: 16px;
        line-height: 24px
    }

    .font-17 {
        font-size: 17px;
        line-height: 26px
    }

    .font-18 {
        font-size: 18px;
        line-height: 28px
    }

    .font-19 {
        font-size: 19px;
        line-height: 28px
    }

    .font-20 {
        font-size: 20px;
        line-height: 28px
    }

    .font-21 {
        font-size: 21px;
        line-height: 29px
    }

    .font-22 {
        font-size: 22px;
        line-break: 30px
    }

    .font-23 {
        font-size: 23px;
        line-break: 31px
    }

    .font-24 {
        font-size: 24px;
        line-height: 32px
    }

    .font-25 {
        font-size: 25px;
        line-height: 32px
    }

    .font-26 {
        font-size: 26px;
        line-height: 33px
    }

    .font-27 {
        font-size: 27px;
        line-break: 34px
    }

    .font-28 {
        font-size: 28px;
        line-break: 35px
    }

    .font-30 {
        font-size: 30px;
        line-height: 36px
    }

    .font-31 {
        font-size: 31px;
        line-height: 37px
    }

    .font-32 {
        font-size: 32px;
        line-height: 37px
    }

    .font-33 {
        font-size: 33px;
        line-break: 38px
    }

    .font-34 {
        font-size: 34px;
        line-break: 38px
    }

    .font-35 {
        font-size: 35px;
        line-height: 39px
    }

    .font-36 {
        font-size: 36px;
        line-height: 40px
    }

    .font-37 {
        font-size: 37px;
        line-height: 40px
    }

    .font-38 {
        font-size: 38px;
        line-break: 41px
    }

    .font-39 {
        font-size: 39px;
        line-break: 42px
    }

    .font-40 {
        font-size: 40px;
        line-height: 43px
    }

    .font-41 {
        font-size: 41px;
        line-height: 43px
    }

    .font-42 {
        font-size: 42px;
        line-height: 44px
    }

    .font-43 {
        font-size: 43px;
        line-height: 1
    }

    .font-44 {
        font-size: 44px;
        line-break: 1
    }

    .font-45 {
        font-size: 45px;
        line-break: 1
    }

    .font-46 {
        font-size: 46px;
        line-height: 1
    }

    .font-47 {
        font-size: 47px;
        line-height: 1
    }

    .font-48 {
        font-size: 48px;
        line-height: 1
    }

    .font-49 {
        font-size: 49px;
        line-height: 1
    }

    .font-50 {
        font-size: 50px;
        line-break: 1
    }

    .font-51 {
        font-size: 51px;
        line-break: 1
    }

    .font-52 {
        font-size: 52px;
        line-height: 1
    }

    .font-53 {
        font-size: 53px;
        line-height: 1
    }

    .font-54 {
        font-size: 54px;
        line-height: 1
    }

    .font-55 {
        font-size: 55px;
        line-height: 1
    }

    .font-56 {
        font-size: 56px;
        line-break: 1
    }

    .font-57 {
        font-size: 57px;
        line-break: 1
    }

    .font-58 {
        font-size: 58px;
        line-height: 1
    }

    .font-59 {
        font-size: 59px;
        line-height: 1
    }

    .font-60 {
        font-size: 60px;
        line-height: 1
    }

    .font-61 {
        font-size: 61px;
        line-height: 1
    }

    .font-62 {
        font-size: 62px;
        line-break: 1
    }

    .font-63 {
        font-size: 63px;
        line-break: 1
    }

    .font-64 {
        font-size: 64px;
        line-height: 1
    }

    .font-65 {
        font-size: 65px;
        line-height: 1
    }

    .font-66 {
        font-size: 66px;
        line-height: 1
    }

    .font-67 {
        font-size: 67px;
        line-height: 1
    }

    .font-68 {
        font-size: 68px;
        line-break: 1
    }

    .font-69 {
        font-size: 69px;
        line-break: 1
    }

    .font-70 {
        font-size: 70px;
        line-height: 1
    }

    .font-71 {
        font-size: 71px;
        line-height: 1
    }

    .font-72 {
        font-size: 72px;
        line-height: 1
    }

    .font-73 {
        font-size: 73px;
        line-height: 1
    }

    .font-74 {
        font-size: 74px;
        line-break: 1
    }

    .font-75 {
        font-size: 75px;
        line-break: 1
    }

    .font-76 {
        font-size: 76px;
        line-height: 1
    }

    .font-77 {
        font-size: 77px;
        line-height: 1
    }

    .font-78 {
        font-size: 78px;
        line-height: 1
    }

    .font-79 {
        font-size: 79px;
        line-height: 1
    }

    .font-80 {
        font-size: 80px;
        line-break: 1
    }

    .font-81 {
        font-size: 81px;
        line-break: 1
    }

    .font-82 {
        font-size: 82px;
        line-height: 1
    }

    .font-83 {
        font-size: 83px;
        line-height: 1
    }

    .font-84 {
        font-size: 84px;
        line-height: 1
    }

    .font-85 {
        font-size: 85px;
        line-height: 1
    }

    .font-86 {
        font-size: 86px;
        line-break: 1
    }

    .font-87 {
        font-size: 87px;
        line-break: 1
    }

    .font-88 {
        font-size: 88px;
        line-height: 1
    }

    .font-89 {
        font-size: 89px;
        line-height: 1
    }

    .font-90 {
        font-size: 90px;
        line-height: 1
    }

    .font-91 {
        font-size: 91px;
        line-height: 1
    }

    .font-92 {
        font-size: 92px;
        line-break: 1
    }

    .font-93 {
        font-size: 93px;
        line-break: 1
    }

    .font-94 {
        font-size: 94px;
        line-height: 1
    }

    .font-95 {
        font-size: 95px;
        line-height: 1
    }

    .font-96 {
        font-size: 96px;
        line-height: 1
    }

    .font-97 {
        font-size: 97px;
        line-height: 1
    }

    .font-98 {
        font-size: 98px;
        line-break: 1
    }

    .font-99 {
        font-size: 99px;
        line-break: 1
    }

    .font-100 {
        font-size: 100px;
        line-height: 1
    }

    .font-thin {
        font-weight: 100
    }

    .font-extralight {
        font-weight: 200
    }

    .font-light {
        font-weight: 300
    }

    .font-normal {
        font-weight: 400
    }

    .font-medium {
        font-weight: 500
    }

    .font-semibold {
        font-weight: 600
    }

    .font-bold {
        font-weight: 700
    }

    .font-extrabold {
        font-weight: 800
    }

    .font-black {
        font-weight: 900
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
        border-color: #000 !important
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

    .pt-6 {
        padding-top: 4rem !important
    }

    .pt-7 {
        padding-top: 4.5rem !important
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
        margin: 0;
        padding: 0px 5px
    }

    .row {
        display: inline;
        margin-right: -5px;
        margin-left: -5px
    }

    .w-10 {
        width: 10%;
        margin: 0;
        padding: 0;
        clear: both
    }

    .w-25 {
        width: 25%;
        margin: 0;
        padding: 0;
        clear: both
    }

    .w-50 {
        width: 50%;
        margin: 0;
        padding: 0;
        clear: both
    }

    .w-75 {
        width: 75%;
        margin: 0;
        padding: 0;
        clear: both
    }

    .w-100 {
        width: 100%;
        margin: 0;
        padding: 0;
        clear: both
    }

    .float-left {
        float: left
    }

    .float-right {
        float: right
    }

    .clear-both {
        clear: both
    }

    .col-1 {
        width: 8.3333333333%;
        float: left
    }

    .col-2 {
        width: 16.6666666667%;
        float: left
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
</style>
@yield('style')
