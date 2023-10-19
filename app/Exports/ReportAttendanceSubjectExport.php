<?php

namespace App\Exports;

use App\Models\Teacher;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class ReportAttendanceSubjectExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
{
    private $rowCount;
    public  $data = [];
    public  $option = [];

    public function __construct($data1, $data2)
    {
        // dd($data['data']);
        $this->data = $data1;
        $this->option = $data2;
    }

    public function collection()
    {
        return collect($this->data);
    }

    public function map($data): array
    {

        $this->rowCount++;
        $dates =  $this->option['attendanceObj'];
        $dataDate = [];
        foreach ($dates as $key => $value) {
            $day =  'attendance_' . $key + 1;
            $dataDate[] = $data[$day];
        }
        $array1 = [
            $this->rowCount,
            $data['student_name'],
            $data['gender']
        ];
        $array2 = [
            $data['total_type_ps'],
            $data['total_type_pm'],
            $data['total_type_al'],
            $data['total_type_a'],
        ];
        $row =  array_merge($array1, $dataDate, $array2);
        return $row;
    }

    public function headings(): array
    {
        $dates =  $this->option['attendanceObj'];
        $dataDate = [];
        foreach ($dates as $key => $value) {
            $dataDate[] = $value['date'];
        }
        $array1 = [
            "ល.រ",
            "គោត្តនាម និងនាម",
            "ភេទ",
        ];
        $array2 = [
            "PS",
            "P",
            "AL",
            "A",
        ];
        $row =  array_merge($array1, $dataDate, $array2);
        return $row;
    }

    public function columnWidths(): array
    {
        return [
            'A' => 5,
            'B' => 15,
            'C' => 5,
            'D' => 10,
            'E' => 10,
            'F' => 10,
            'G' => 10,
            'H' => 10,
            'I' => 10,
            'J' => 10,
            'K' => 10,
            'L' => 10,
            'M' => 10,
            'N' => 10,
            'O' => 10,
            'P' => 10,
            'Q' => 10,
            'R' => 10,
            'S' => 10,
            'T' => 10,
            'U' => 10,
            'V' => 10,
            'W' => 10,
            'X' => 10,
            'Y' => 10,
            'Z' => 10,
            'AA' => 10,
            'AB' => 10,
            'AC' => 10,
            'AD' => 10,
            'AE' => 10,
            'AF' => 10,
            'AG' => 10,
            'AH' => 10,
            'AI' => 10,
            'AJ' => 10,
            'AK' => 10,
        ];
    }
}
