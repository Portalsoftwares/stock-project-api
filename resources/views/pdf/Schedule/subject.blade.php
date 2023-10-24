{{-- @extends('pdf.master-attendance', ['data' => $option['class'], 'title' => $option['exam']['name']]) --}}
@extends('pdf.master-attendance')
@section('body1')
    <div class="row">
        <div class="col-12 py-2">
            <h1 class="font-muollight font-13 text-center">កាលវិភាគប្រចាំសប្ដាហ៍​ថ្នាក់ទី​ {{ $option['class']['class_name'] }} {{ $option['academic']['academic_name'] }} </h1>
        </div>
        <div class="row">
            <div class="col-12  mt-3" style="padding-bottom: 20px">
                <table width="100%" autosize="1.6" style="border-collapse: collapse; border-style: solid;" cellpadding="8">
                    <thead>
                        <tr>

                            <td class="w-description">
                                <p class="font-siemreap font-14">ម៉ោង</p>
                            </td>

                            @foreach ($option['day'] as $inex => $date)
                                <td class="w-day">
                                    <p class="font-siemreap font-14">{{ $date['day_name_kh'] }}</p>
                                </td>
                            @endforeach

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data as $i => $itemLine)
                            <tr>

                                <td class="font-siemreap text-center items-center font-14">
                                    <div>{{ $itemLine['name'] }}</div>
                                    <div>{{ $itemLine['start_date'] }} - {{ $itemLine['end_date'] }}</div>
                                </td>
                                @foreach ($option['day'] as $inex => $date)
                                    <td class="font-siemreap flex text-center items-center font-14 ">
                                        <div>
                                            {{ !empty($itemLine['name_subject_grade_day_' . $date->day_id]) ? $itemLine['name_subject_grade_day_' . $date->day_id]['subject']['subject_name_kh'] : '' }}
                                        </div>
                                        <div>
                                            {{ !empty($itemLine['name_subject_grade_day_' . $date->day_id]) ? $itemLine['name_subject_grade_day_' . $date->day_id]['subject']['subject_sort_name_en'] : '' }}
                                        </div>
                                    </td>
                                @endforeach

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
            /* table */
            table {
                border-collapse: collapse;
            }

            .items-center {
                text-align: center !important
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
                width: 10%
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
