<?php

namespace App\Exports;

use App\Models\Teacher;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class ReportAttendanceExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
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
        $dates =  $this->option['dates'];
        $dataDate = [];
        foreach ($dates as $key => $value) {
            $day =  'day_' . $key + 1;
            $dataDate[] = $data[$day] ?? 0;
        }
        $array1 = [
            $this->rowCount,
            $data['student_name'],
            $data['gender']
        ];
        $array2 = [
            $data['total_type_pm'],
            $data['total_type_a'],
            $data['total'],
        ];
        $row =  array_merge($array1, $dataDate, $array2);
        return $row;
    }

    public function headings(): array
    {
        $dates =  $this->option['dates'];
        $dataDate = [];
        foreach ($dates as $key => $value) {
            $dataDate[] = $key + 1;
        }
        $array1 = [
            "ល.រ",
            "គោត្តនាម និងនាម",
            "ភេទ",
        ];
        $array2 = [
            "ច្បាប់",
            "អត់ច្បាប់",
            "សរុប",
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
            'D' => 2.8,
            'E' => 2.8,
            'F' => 2.8,
            'G' => 2.8,
            'H' => 2.8,
            'I' => 2.8,
            'J' => 2.8,
            'K' => 2.8,
            'L' => 2.8,
            'M' => 2.8,
            'N' => 2.8,
            'O' => 2.8,
            'P' => 2.8,
            'Q' => 2.8,
            'R' => 2.8,
            'S' => 2.8,
            'T' => 2.8,
            'U' => 2.8,
            'V' => 2.8,
            'W' => 2.8,
            'X' => 2.8,
            'Y' => 2.8,
            'Z' => 2.8,
            'AA' => 2.8,
            'AB' => 2.8,
            'AC' => 2.8,
            'AD' => 2.8,
            'AE' => 2.8,
            'AF' => 2.8,
            'AG' => 2.8,
            'AH' => 2.8,
            'AI' => 2.8,
            'AJ' => 2.8,
            'AK' => 2.8,
        ];
    }
}
