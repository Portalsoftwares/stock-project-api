@extends('pdf.master', ['data' => null, 'title' => 'បញ្ជីរ មុខវិជ្ជា'])
@section('body1')
    @php
        $line_count = count($subjects);
    @endphp
    <div class="row">
        <div class="col-12 py-2">
            <h1 class="font-muollight font-13 text-center">បញ្ជីរ មុខវិជ្ជា</h1>
        </div>
        <div class="row">
            <div class="col-12  mt-3" style="padding-bottom: 20px">
                <table width="100%" autosize="1.6" style="border-collapse: collapse; border-style: solid;" cellpadding="8">
                    <thead>
                        <tr>
                            <td class="font-siemreap font-13" style="width: 7%">ល.រ</td>
                            <td class="font-siemreap font-13">មុខវិជ្ជា</td>
                            <td class="font-siemreap font-13">មុខវិជ្ជា (អង់គ្លេស)</td>
                            <td class="font-siemreap font-13">មុខវិជ្ជា (អក្សរកាត់)</td>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($subjects as $key => $subject)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    {{ $key + 1 }}
                                </td>
                                <td class="font-siemreap font-13" style="text-align: left;">
                                    {{ $subject->subject_name_kh }}
                                </td>
                                <td class="font-siemreap font-13" style="text-align: left;">
                                    {{ $subject->subject_name_en }}
                                </td>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    {{ $subject->subject_sort_name_en }}
                                </td>
                            </tr>
                        @endforeach
                        @if ($line_count <= 0)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    1
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 1)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    2
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 2)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    3
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 3)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    4
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 4)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    5
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 5)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    6
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 6)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    7
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 7)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    8
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 8)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    9
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 9)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    10
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 10)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    11
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 11)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    12
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 12)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    13
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 13)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    14
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 14)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    15
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 15)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    16
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 16)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    17
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 17)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    18
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 18)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    19
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 19)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    20
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 20)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    21
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 21)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    22
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 22)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    23
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 23)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    24
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        @if ($line_count <= 24)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    25
                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                                <td class="font-siemreap font-13">

                                </td>
                            </tr>
                        @endif
                        <tr>
                            <td colspan="3">
                                <div class="font-siemreap font-13">សរុប </div>
                            </td>
                            <td class="font-siemreap font-14">
                                <div style="width: 100%; text-align: right; padding: 3px 5px 3px 0;">
                                    {{ $line_count }}
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('style')
    <style>
        /* table */
        table {
            border-collapse: collapse;
        }

        table thead tr td {
            padding: 5px;
            border: 1px solid #000000;
            text-align: center;
        }

        table thead tr td.w-no {
            width: 5%;
        }

        table thead tr td.w-item {
            width: 20%;
        }

        table thead tr td.w-description {
            width: 60%;
        }

        table thead tr td.w-qty {
            width: 15%
        }

        table thead tr td.w-unit {
            width: 15%;
        }

        table thead tr td.w-unit-price {
            width: 15%;
        }

        table thead tr td.w-amount {
            width: 15%;
        }

        table tr td {
            padding: 5px;
            border-left: 1px solid #000000;
            border-right: 1px solid #000000;
        }

        table tbody td {
            vertical-align: top;
        }

        table tbody {
            border: 1px solid #000000 !important;
        }

        table tbody tr {
            border-width: 1px;
            border-style: solid;
            border-color: #000000;
        }

        table tfoot tr td,
        th {
            border-width: 1px;
            border-style: solid;
            border-color: #000000;
        }

        table tfoot tr td.noborder {
            border-bottom-width: 0;
            border-left-width: 0;
        }

        .vattin {
            width: 100%;
            margin: 0;
            padding: 0;
            text-align: center;
            clear: both;
        }

        .tin {
            width: 7%;
            height: 14px;
            padding: 0px -5px;
            margin: 0px 3px;
            float: left;
            text-align: center;
            border-width: 1px;
            border-style: solid;
            border-color: #212529;
            font-size: 11px;
        }

        .tin-none {
            width: 7%;
            height: 14px;
            padding: 0px -5px;
            font-size: 10px;
            float: left;
            text-align: center;
            border-width: 1px;
        }

        .clear {
            clear: both;
        }

        .bg-gray {
            background-color: #ccc;
        }

        .subitem {
            padding: 0 0 0 10px;
        }
    </style>
@endsection
