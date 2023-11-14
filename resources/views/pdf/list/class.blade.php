@extends('pdf.master', ['data' => null, 'title' => 'បញ្ជីរថ្នាក់រៀន'])
@section('body1')
    @php
        $line_count = count($classes);
    @endphp
    <div class="row">
        <div class="col-12 py-2">
            <h1 class="font-muollight font-13 text-center">បញ្ជីរថ្នាក់រៀន</h1>
        </div>
        <div class="row">
            <div class="col-12  mt-3" style="padding-bottom: 20px">
                <table width="100%" autosize="1.6" style="border-collapse: collapse; border-style: solid;" cellpadding="8">
                    <thead>
                        <tr>
                            <td class="font-siemreap font-13" style="width: 7%">ល.រ</td>
                            <td class="font-siemreap font-13">ឈ្មោះថ្នាក់</td>
                            <td class="font-siemreap font-13">គ្រូសរុប</td>
                            <td class="font-siemreap font-13">សិស្សសរុប</td>
                            <td class="font-siemreap font-13">ប្រភេទថ្នាក់</td>
                            <td class="font-siemreap font-13">ឆ្នាំសិក្សា</td>
             
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($classes as $key => $class)
                            <tr>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    {{ $key + 1 }}
                                </td>
                                <td class="font-siemreap font-13" style="text-align: left;">
                                    {{ $class->class_name}}
                                </td>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    {{ count($class->get_teacher_in_class)}}
                                </td>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    {{ count($class->count_student_in_class) }}
                                </td>
                                <td class="font-siemreap font-13" style="text-align: center;">
                                    {{  $class->class_type['name']}}
                                </td>
                                <td class="font-siemreap font-13" style="text-align: left;">
                                    {{  $class->academic['academic_name']}}
                                </td>
                    
                            </tr>
                        @endforeach
                        <tr>
                            <td colspan="5">
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
