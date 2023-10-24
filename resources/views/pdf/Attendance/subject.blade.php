{{-- @extends('pdf.master-attendance', ['data' => $option['class'], 'title' => $option['exam']['name']]) --}}
@extends('pdf.master-attendance')
@section('body1')
    <div class="row">
        <div class="col-12 py-2">
            <h1 class="font-muollight font-13 text-center">បញ្ជីសម្រង់អវត្តមានសិស្សថ្នាក់ទី​ {{ $option['class'] }} {{ $option['subject']['subject']['subject_name_kh'] }}
            </h1>
        </div>
        <div class="row">
            <div class="col-12  mt-3" style="padding-bottom: 20px">
                <table width="100%" autosize="1.6" style="border-collapse: collapse; border-style: solid;" cellpadding="8">
                    <thead>
                        <tr>
                            <td class="w-no">
                                <p class="font-siemreap font-14">ល.រ</p>
                            </td>
                            <td class="w-description">
                                <p class="font-siemreap font-14">គោត្តនាមនិងនាម</p>
                            </td>
                            <td class="w-qty">
                                <p class="font-siemreap font-14">ភេទ</p>
                            </td>
                            @foreach ($option['attendanceObj'] as $inex => $date)
                                <td class="w-day">
                                    <p class="font-siemreap font-14">{{ \Carbon\Carbon::create($date['date'])->format('d-m-Y') }}</p>
                                </td>
                            @endforeach
                            <td class="w-att text-center">
                                <p class="font-siemreap  font-14" style="color: #19d256">PS</p>
                            </td>
                            <td class="w-att text-center">
                                <p class="font-siemreap  font-14" style="color: #ca8a04">P</p>
                            </td>
                            <td class="w-att text-center">
                                <p class="font-siemreap  font-14" style="color: #2563eb">AL</p>
                            </td>
                            <td class="w-att text-center">
                                <p class="font-siemreap  font-14" style="color: #DC2626">A</p>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data as $i => $itemLine)
                            <tr>
                                <td class="font-siemreap text-center font-14 last-child">
                                    {{ $i + 1 }}
                                </td>
                                <td class="font-siemreap font-14">
                                    {{ $itemLine['student_name'] }}
                                </td>
                                <td class="font-siemreap text-center font-14">
                                    {{ $itemLine['gender'] }}
                                </td>
                                @foreach ($option['attendanceObj'] as $inex => $date)
                                    <td class="font-siemreap text-center font-14">
                                        @if ($itemLine['attendance_' . $inex + 1] == 'PS')
                                            <span>
                                                <svg xmlns="http://www.w3.org/2000/svg" height="12px" viewBox="0 0 448 512">
                                                    <style>
                                                        svg {
                                                            fill: #19d256
                                                        }
                                                    </style>
                                                    <path
                                                        d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z" />
                                                </svg>
                                            </span>
                                        @endif
                                        @if ($itemLine['attendance_' . $inex + 1] == 'P')
                                            <span style="color: #ca8a04">P</span>
                                        @endif
                                        @if ($itemLine['attendance_' . $inex + 1] == 'AL')
                                            <span style="color: #2563eb">AL</span>
                                        @endif
                                        @if ($itemLine['attendance_' . $inex + 1] == 'A')
                                            <span style="color: #DC2626">A</span>
                                        @endif
                                    </td>
                                @endforeach
                                <td class="font-siemreap text-center font-14" style="color: #19d256">
                                    {{ $itemLine['total_type_ps'] }}
                                </td>
                                <td class="font-siemreap text-center font-14" style="color: #ca8a04">
                                    {{ $itemLine['total_type_pm'] }}
                                </td>
                                <td class="font-siemreap text-center font-14" style="color: #2563eb">
                                    {{ $itemLine['total_type_al'] }}
                                </td>
                                <td class="font-siemreap text-center font-14" style="color: #DC2626">
                                    {{ $itemLine['total_type_a'] }}
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="col-12" style="padding-bottom: 10px">
                <div class="row">
                    <div class="col-6 text-center">
                        <div class="font-siemreap font-14 ">បានឃើញ និងឯកភាព</div>
                        <h1 class="font-muollight font-13 text-center">នាយកសាលា</h1>
                    </div>
                    <div class="col-6 text-center">
                        <div class="font-siemreap font-14 ">ថ្ងៃ............... ខែ.......... ​ឆ្នាំ........... ព.ស២៥៦៧</div>
                        <div class="font-siemreap font-14 mt-1">វិ.ច.ប.ព ថ្ងៃទី........ ខែ....... ឆ្នាំ២០២៣</div>
                        <div class="font-siemreap font-14 mt-1">ហត្ថលេខាគ្រូបន្ទក់ថ្នាក់</div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
    @section('style')
        <style>
            svg {
                fill: #19d256 color: #19d256 background: #19d256
            }

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
                width: 15%;
            }

            table thead tr td.w-qty {
                width: 5%
            }

            table thead tr td.w-day {
                width: 2%
            }

            table thead tr td.w-att {
                width: 6%;
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
