@extends('pdf.master', ['data' => $class['class_name'], 'title' => 'បញ្ជីរាយនាមសិស្សតាមថ្នាក់'])
@section('body1')
    @php
        $line_count = count($students);
        $f_count = 0;
        $m_count = 0;
        foreach ($students as $key => $student) {
            if ($student['student_in_class']['gender']['gender_name_kh'] == 'ស្រី') {
                $f_count++;
            } else {
                $m_count++;
            }
        }

    @endphp
    <div class="row">
        <div class="col-12 py-2">
            <h1 class="font-muollight font-13 text-center">បញ្ជីរាយនាមសិស្សតាមថ្នាក់ {{ $class['academic']['academic_name'] }}</h1>
        </div>
        <div class="col-12  mt-3" style="padding-bottom: 20px">
            <table width="100%" autosize="1.6" style="border-collapse: collapse; border-style: solid;" cellpadding="8">
                <thead>
                    <tr>
                        <td class="font-siemreap font-13" style="width: 7%">ល.រ</td>
                        <td class="font-siemreap font-13">គោត្តនាមនិងនាម</td>
                        <td class="font-siemreap font-13">ភេទ</td>
                        <td class="font-siemreap font-13">ថ្ងៃ/ខែ/ឆ្នាំកំណើត</td>
                        <td class="font-siemreap font-13">លេខទូរស័ព្ទ</td>
                        <td class="font-siemreap font-13">ផ្សេងៗ</td>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($students as $key => $student)
                        <tr>
                            <td class="font-siemreap font-13" style="text-align: center;">
                                {{ $key + 1 }}
                            </td>
                            <td class="font-siemreap font-13" style="text-align: left;">
                                {{ $student['student_in_class']['full_name_kh'] }}
                            </td>
                            <td class="font-siemreap font-13" style="text-align: center;">
                                {{ $student['student_in_class']['gender']['gender_name_kh'] }}
                            </td>
                            <td class="font-siemreap font-13" style="text-align: left;">
                                {{ \Carbon\Carbon::create($student['student_in_class']['date_of_birth'])->format('d-m-Y') }}
                            </td>
                            <td class="font-siemreap font-13" style="text-align: left;">
                                {{ $student['student_in_class']['phone'] }}
                            </td>
                            <td class="font-siemreap font-13" style="text-align: left;">
                                {{ $student['student_in_class']['other'] }}
                            </td>
                        </tr>
                    @endforeach
                    @for ($i = $line_count; $i <= 25 - $line_count; $i++)
                        <tr>
                            <td class="font-siemreap font-13" style="text-align: center;">
                                {{ $i }}
                            </td>
                            <td class="font-siemreap font-13">

                            </td>
                            <td class="font-siemreap font-13">

                            </td>
                            <td class="font-siemreap font-13">

                            </td>
                            <td class="font-siemreap font-13">

                            </td>
                            <td class="font-siemreap font-13">

                            </td>

                        </tr>
                    @endfor
                    {{-- <tr>
                        <td colspan="5">
                            <div class="font-siemreap font-13">សរុប </div>
                        </td>
                        <td class="font-siemreap font-14">
                            <div style="width: 100%; text-align: right; padding: 3px 5px 3px 0;">
                                {{ $line_count }}
                            </div>
                        </td>
                    </tr> --}}
                </tbody>
            </table>
        </div>
        <div class="col-12" style="padding-bottom: 10px">
            <div class="row">
                <div class="col-6 text-center">
                    <span class="font-siemreap font-13 ">សិស្សសរុប : {{ $line_count }} នាក់</span>
                    <span class="font-siemreap font-13 "> សិស្សប្រុស : {{ $m_count }} នាក់</span>
                    <span class="font-siemreap font-13 "> សិស្សស្រី : {{ $f_count }} នាក់</span>
                </div>
            </div>
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
